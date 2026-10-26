--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║              SOVEREIGN HUB  ·  v2.0 REMASTER                   ║
    ║          Blox Fruits PvP Control Center                         ║
    ║  Features: AutoBounty · Kitsune One Shot · Aimbot · ESP        ║
    ║             CamLock · Glitches · Fruit · Visual · More         ║
    ╚══════════════════════════════════════════════════════════════════╝
    Toggle: RightShift  |  Mobile: floating S button
--]]

-- ═══════════════════════════════════════
--  GLOBALS & NAMESPACE
-- ═══════════════════════════════════════
_G.Spooky = _G.Spooky or {}
local Spooky = _G.Spooky
Spooky.Diagnostics    = { errors = {}, statuses = {}, lastNotice = {} }
Spooky.Globals        = Spooky.Globals    or {}
Spooky.State          = Spooky.State      or {}
Spooky.Config         = Spooky.Config     or {}
Spooky.VFX            = Spooky.VFX        or {}
Spooky.UI             = Spooky.UI         or {}
Spooky.Cache          = Spooky.Cache      or {}
Spooky.Closures       = Spooky.Closures   or {}
Spooky.ToggleCopies   = {}
Spooky.AppliedFeatures = {}
Spooky.FeatureVersions = {}
Spooky.RetiredFeatures = {
    GunAimbot = true, FruitDiscordNotify = true, FruitAutoClipTP = true,
}

_G.PlayerBlacklist = _G.PlayerBlacklist or {}
Spooky.Blacklist   = _G.PlayerBlacklist

-- ═══════════════════════════════════════
--  SERVICES
-- ═══════════════════════════════════════
local Players           = game:GetService("Players")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting          = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- Safe getgenv fallback
if type(getgenv) ~= "function" then
    getgenv = function() return _G end
end

-- Anti-AFK
pcall(function()
    LocalPlayer.Idled:Connect(function()
        pcall(function()
            local vu = game:GetService("VirtualUser")
            if vu then vu:ClickButton2(Vector2.new(0, 0)) end
        end)
    end)
end)

-- ═══════════════════════════════════════
--  DIAGNOSTICS
-- ═══════════════════════════════════════
function Spooky.ReportIssue(feature, err)
    local d    = Spooky.Diagnostics
    local text = tostring(err)
    local item = d.errors[feature]
    d.errors[feature] = {
        message = text,
        count   = (item and item.count or 0) + 1,
        time    = os.clock(),
    }
    if not d.lastNotice[feature] or os.clock() - d.lastNotice[feature] > 15 then
        d.lastNotice[feature] = os.clock()
        warn("[Sovereign / " .. feature .. "] " .. text)
    end
end

-- ═══════════════════════════════════════
--  GUI PARENT (safe, never crashes)
-- ═══════════════════════════════════════
local TargetParent
do
    local ok, h = pcall(function() return gethui and gethui() end)
    if ok and h then
        TargetParent = h
    elseif syn and syn.protect_gui then
        pcall(syn.protect_gui, PlayerGui)
        TargetParent = PlayerGui
    else
        TargetParent = PlayerGui
    end
end

local function safeParent(gui)
    if not gui then return end
    if not pcall(function() gui.Parent = TargetParent end) then
        pcall(function()
            gui.Parent = LocalPlayer:FindFirstChild("PlayerGui")
                      or LocalPlayer:WaitForChild("PlayerGui", 3)
        end)
    end
end

-- ═══════════════════════════════════════
--  SESSION MANAGEMENT
-- ═══════════════════════════════════════
if _G.Spooky_Cleanup then pcall(_G.Spooky_Cleanup) end

local SCRIPT_SESSION = tick()
_G.Spooky_Session = SCRIPT_SESSION
local function isCurrentSession()
    return _G.Spooky_Session == SCRIPT_SESSION
end

local ActiveConnections = {}
local function registerConnection(conn)
    if conn then table.insert(ActiveConnections, conn) end
    return conn
end

-- ═══════════════════════════════════════
--  FEATURE STATE ENGINE
-- ═══════════════════════════════════════
local FeatureStates    = {}
local FeatureCallbacks = {}
_G.FeatureStates    = FeatureStates
_G.FeatureCallbacks = FeatureCallbacks

function Spooky.ResolveFeature(name)
    return ({
        FruitsM1     = "OneShotKitsune",
        InfiniteSoru = "InfinitySoru",
        SpeedHack    = "WalkSpeed",
    })[name] or name
end

local function setFeatureState(name, active, skipCB)
    name   = Spooky.ResolveFeature(name)
    if Spooky.RetiredFeatures[name] then FeatureStates[name] = false; return end
    active = (active == true)
    Spooky.FeatureVersions[name] = (Spooky.FeatureVersions[name] or 0) + 1
    local version = Spooky.FeatureVersions[name]
    FeatureStates[name] = active
    if not skipCB and FeatureCallbacks[name] then
        local cb = FeatureCallbacks[name]
        task.spawn(function()
            if not isCurrentSession() or Spooky.FeatureVersions[name] ~= version then return end
            local ok, err = pcall(cb, active)
            if ok  then Spooky.AppliedFeatures[name] = cb
            else        Spooky.ReportIssue(name, err) end
        end)
    end
end

local function toggleFeature(name)
    name = Spooky.ResolveFeature(name)
    local new = not (FeatureStates[name] or false)
    setFeatureState(name, new)
    print(string.format("[Sovereign] %s: %s", name, new and "ON" or "OFF"))
    return new
end

_G.toggleFeature   = toggleFeature
_G.setFeatureState = setFeatureState

-- ═══════════════════════════════════════
--  SETTINGS
-- ═══════════════════════════════════════
local Settings = {
    walkSpeed           = 216,
    superJumpHeight     = 500,
    magnetHp            = 40,
    raceHp              = 35,
    soruDelay           = 0.30,
    soruSkill           = "Z",
    soruWeapon          = "Fruit",
    camLockSmoothness   = 0.35,
    camLockPrediction   = 0.04,
    tracerColorName     = "Red",
    m1Range             = 100,
    giantScale          = 5,
    shaderIdx           = 1,
    spoofLevel          = 2800,
    autoBuso            = false,
    autoKen             = false,
}

-- ═══════════════════════════════════════
--  COMBAT HELPERS
-- ═══════════════════════════════════════
local function getToolCategory(tool)
    if not tool then return "Melee" end
    local name = tool.Name:lower()
    for _, g in ipairs({"guitar","rifle","cannon","gun","slingshot","kabucha","bow"}) do
        if name:find(g) then return "Gun" end
    end
    for _, m in ipairs({"claw","godhuman","superhuman","talon","step","karate","breath","combat","fist","sanguine"}) do
        if name:find(m) then return "Melee" end
    end
    if name:find("fruit") or name:find("-") then return "Fruit" end
    return "Sword"
end

local function getMyHRP()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function isInSafeZone(target)
    local ok, result = pcall(function()
        local char = (target and target.Character) or (target and target:IsA("Model") and target)
        if not char then return false end
        if char:FindFirstChildOfClass("ForceField") then return true end
        if char:GetAttribute("SafeZone") == true    then return true end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return false end
        local wo    = workspace:FindFirstChild("_WorldOrigin")
        local zones = wo and wo:FindFirstChild("SafeZones")
        if zones then
            for _, zone in pairs(zones:GetChildren()) do
                if zone:IsA("BasePart") then
                    local r = math.min(zone.Size.X, zone.Size.Z) / 2
                    r = math.clamp(r, 1, 350)
                    if (zone.Position - hrp.Position).Magnitude <= r then
                        return true
                    end
                end
            end
        end
        return false
    end)
    return ok and result
end

-- Returns true if target is an enemy (opposite team or no team)
local function isEnemy(target)
    if not target or target == LocalPlayer then return false end
    local myTeam     = LocalPlayer.Team
    local targetTeam = target.Team
    -- If teams are assigned, check opposition
    if myTeam and targetTeam then
        return myTeam ~= targetTeam
    end
    -- No team system — everyone else is an enemy
    return true
end

local function isCombatValid(player, maxDist)
    if not player or player == LocalPlayer then return false end
    local bl = _G.PlayerBlacklist
    if bl and (bl[player.UserId] or bl[player.Name]) then return false end
    if not isEnemy(player) then return false end
    if isInSafeZone(player) then return false end
    local char = player.Character
    if not char or not char.Parent then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or hum.Health <= 0 or not hrp then return false end
    if maxDist then
        local myHrp = getMyHRP()
        if myHrp and (hrp.Position - myHrp.Position).Magnitude > maxDist then
            return false
        end
    end
    return true
end

local function getClosestEnemy(maxDist)
    maxDist = maxDist or 1000
    local myHrp = getMyHRP()
    if not myHrp then return nil end
    local best, bestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if isCombatValid(p, maxDist) then
            local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - myHrp.Position).Magnitude
                if d < bestDist then bestDist = d; best = p.Character end
            end
        end
    end
    return best
end

local function faceTarget(targetPos)
    if not targetPos then return end
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local cur = hrp.Position
    local lv  = Vector3.new(targetPos.X - cur.X, 0, targetPos.Z - cur.Z)
    if lv.Magnitude < 0.1 then return end
    pcall(function()
        hrp.CFrame = CFrame.lookAt(cur, cur + lv.Unit, Vector3.new(0, 1, 0))
    end)
end

-- ═══════════════════════════════════════
--  NOTIFICATION
-- ═══════════════════════════════════════
local function notify(msg, _state)
    print("[Sovereign Hub] " .. tostring(msg))
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title    = "Sovereign Hub",
            Text     = tostring(msg),
            Duration = 4,
        })
    end)
end

-- ═══════════════════════════════════════════════════════════════
--  AUTO BOUNTY
-- ═══════════════════════════════════════════════════════════════
do
    local bountyRunning = false
    local bountyConns   = {}

    local function disconnectBounty()
        for _, c in ipairs(bountyConns) do pcall(function() c:Disconnect() end) end
        table.clear(bountyConns)
    end

    local function getCommF()
        local rem = ReplicatedStorage:FindFirstChild("Remotes")
        return rem and rem:FindFirstChild("CommF_")
    end

    local function applyBuso()
        if not (FeatureStates["AutoBuso"] or Settings.autoBuso) then return end
        pcall(function()
            local commF = getCommF()
            if commF then
                local char = LocalPlayer.Character
                if char and not char:GetAttribute("HasBuso") then
                    commF:InvokeServer("Buso")
                end
            end
        end)
    end

    LocalPlayer.CharacterAdded:Connect(function()
        task.spawn(function()
            task.wait(1.5)
            applyBuso()
            task.wait(2.5)
            applyBuso()
        end)
    end)

    local function stopAutoBounty()
        disconnectBounty()
        bountyRunning                     = false
        getgenv().SpookyAutoBountyRunning = false
        notify("Auto Bounty: STOPPED", false)
    end
    _G.StopAutoBounty = stopAutoBounty

    local function startAutoBounty()
        if bountyRunning then notify("Auto Bounty already running!", true); return end
        disconnectBounty()
        bountyRunning                     = true
        getgenv().SpookyAutoBountyRunning = true
        notify("Auto Bounty: STARTED — hunting targets...", true)

        -- Respawn buso
        local respawnConn = LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1.5)
            applyBuso()
        end)
        table.insert(bountyConns, respawnConn)

        -- Initial buso
        task.spawn(applyBuso)

        -- Hunt loop
        task.spawn(function()
            while bountyRunning and isCurrentSession() do
                task.wait(0.35)
                pcall(function()
                    if not bountyRunning then return end
                    local myChar = LocalPlayer.Character
                    local myHrp  = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    local myHum  = myChar and myChar:FindFirstChildOfClass("Humanoid")
                    if not myHrp or not myHum or myHum.Health <= 0 then return end

                    local target = getClosestEnemy(800)
                    if not target then return end
                    local tHrp = target:FindFirstChild("HumanoidRootPart")
                    if not tHrp then return end

                    faceTarget(tHrp.Position)

                    local dist = (tHrp.Position - myHrp.Position).Magnitude
                    if dist > 14 then
                        local dir = (tHrp.Position - myHrp.Position).Unit
                        pcall(function()
                            myHrp.CFrame = CFrame.new(tHrp.Position - dir * 8)
                            myHrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end)
                    end

                    -- Fire M1 and skill remotes
                    local commF = getCommF()
                    if commF then
                        pcall(function() commF:InvokeServer("M1", tHrp) end)
                    end

                    -- Try equipped tool remotes
                    if myChar then
                        for _, obj in ipairs(myChar:GetChildren()) do
                            if obj:IsA("Tool") then
                                local lr = obj:FindFirstChild("LeftClickRemote")
                                if lr then
                                    local dir2 = (tHrp.Position - myHrp.Position).Unit
                                    pcall(function() lr:FireServer(dir2, 1, false) end)
                                end
                            end
                        end
                    end
                end)
            end
        end)

        -- Low-HP escape
        task.spawn(function()
            while bountyRunning and isCurrentSession() do
                task.wait(1.0)
                pcall(function()
                    local char = LocalPlayer.Character
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    if not hum or not hrp or hum.Health <= 0 then return end
                    local hpPct = (hum.Health / math.max(hum.MaxHealth, 1)) * 100
                    if hpPct < 20 then
                        pcall(function()
                            hrp.CFrame = CFrame.new(-380.479, 77.22, 255.826)
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end)
                        notify("Auto Bounty: Low HP escape!", false)
                        task.wait(4)
                    end
                end)
            end
        end)
    end
    _G.StartAutoBounty = startAutoBounty

    FeatureCallbacks["AutoBounty"] = function(v)
        if v then startAutoBounty() else stopAutoBounty() end
    end

    FeatureCallbacks["AutoBuso"] = function(v)
        Settings.autoBuso = v
        if v then applyBuso() end
        notify("Auto Buso: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  KITSUNE ONE SHOT  (FruitsM1)
-- ═══════════════════════════════════════════════════════════════
do
    _G.FruitsM1Enable     = false
    _G.FruitsM1DelayValue = 0.15

    local function getFruitRemote()
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if not tool or getToolCategory(tool) ~= "Fruit" then return nil end
        local r = tool:FindFirstChild("LeftClickRemote")
               or tool:FindFirstChild("ClickRemote")
               or tool:FindFirstChild("M1Remote")
        if r and r:IsA("RemoteEvent") then return r end
        for _, child in ipairs(tool:GetChildren()) do
            if child:IsA("RemoteEvent") and child.Name:lower():find("click") then return child end
        end
        return nil
    end

    task.spawn(function()
        while isCurrentSession() do
            task.wait(math.clamp(tonumber(_G.FruitsM1DelayValue) or 0.15, 0.05, 2))
            if not isCurrentSession() then break end
            if _G.FruitsM1Enable or FeatureStates["OneShotKitsune"] then
                pcall(function()
                    local char   = LocalPlayer.Character
                    local root   = char and char:FindFirstChild("HumanoidRootPart")
                    local remote = getFruitRemote()
                    if not root or not remote then return end

                    local function tryFolder(folder)
                        if not folder then return false end
                        for _, model in ipairs(folder:GetChildren()) do
                            local hrp = model:FindFirstChild("HumanoidRootPart")
                            local hum = model:FindFirstChildOfClass("Humanoid")
                            if model ~= char and hrp and hum and hum.Health > 0
                               and (hrp.Position - root.Position).Magnitude < 500 then
                                local player = Players:GetPlayerFromCharacter(model)
                                if not player or isCombatValid(player, 500) then
                                    remote:FireServer(Vector3.new(9e30, 9e30, 9e30), 5, false)
                                    local dir = (hrp.Position - root.Position).Unit
                                    remote:FireServer(dir, 5, false)
                                    return true
                                end
                            end
                        end
                        return false
                    end

                    if not tryFolder(workspace:FindFirstChild("Characters")) then
                        tryFolder(workspace:FindFirstChild("Enemies"))
                    end
                end)
            end
        end
    end)

    FeatureCallbacks["OneShotKitsune"] = function(state)
        _G.FruitsM1Enable = state
        notify("Kitsune One Shot: " .. (state and "ENABLED" or "DISABLED"), state)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  AIMBOT (3 modes)
-- ═══════════════════════════════════════════════════════════════
do
    local currentSkillKey  = nil
    local lastSkillTime    = 0
    local aimbot1TargetPos = nil
    _G.aimbot1TargetPos    = nil

    local function setSkillKey(key)
        currentSkillKey = key
        lastSkillTime   = os.clock()
        if FeatureStates["AimbotPlayer1"] or FeatureStates["AimbotNpc1"] then
            if aimbot1TargetPos then task.spawn(faceTarget, aimbot1TargetPos) end
        end
        task.spawn(function()
            local t = lastSkillTime
            task.wait(1.5)
            if lastSkillTime == t and currentSkillKey == key then currentSkillKey = nil end
        end)
    end
    _G.SpookySetSkillKey = setSkillKey

    registerConnection(UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        local map = {
            [Enum.KeyCode.Z] = "Z", [Enum.KeyCode.X] = "X",
            [Enum.KeyCode.C] = "C", [Enum.KeyCode.V] = "V",
            [Enum.KeyCode.F] = "F",
        }
        local k = map[input.KeyCode]
        if k then
            setSkillKey(k)
        elseif input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            setSkillKey("TAP")
        end
    end))

    registerConnection(RunService.Heartbeat:Connect(function()
        if not isCurrentSession() then return end
        local anyAimbot = FeatureStates["AimbotPlayer1"] or FeatureStates["AimbotPlayer2"]
                       or FeatureStates["AimbotPlayer3"]
        if not anyAimbot then
            aimbot1TargetPos   = nil
            _G.aimbot1TargetPos = nil
            return
        end
        local target = getClosestEnemy(1000)
        if not target then
            aimbot1TargetPos   = nil
            _G.aimbot1TargetPos = nil
            return
        end
        local hrp = target:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local pos = hrp.Position
        aimbot1TargetPos   = pos
        _G.aimbot1TargetPos = pos

        if FeatureStates["AimbotPlayer1"] and currentSkillKey then faceTarget(pos) end
        if FeatureStates["AimbotPlayer2"] then faceTarget(pos) end
        if FeatureStates["AimbotPlayer3"] then
            _G.G_SilentAimTargetPos = pos
            pcall(function()
                workspace.CurrentCamera.CFrame =
                    CFrame.new(workspace.CurrentCamera.CFrame.Position, pos)
            end)
        end
    end))

    for _, id in ipairs({
        "AimbotPlayer1","AimbotPlayer2","AimbotPlayer3",
        "AimbotNpc1","AimbotNpc2","AimbotNpc3",
    }) do
        FeatureCallbacks[id] = function(v)
            notify("Aimbot " .. id .. ": " .. (v and "ON" or "OFF"), v)
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
--  CAM LOCK
-- ═══════════════════════════════════════════════════════════════
do
    registerConnection(RunService.RenderStepped:Connect(function()
        if not isCurrentSession() or not FeatureStates["CamLock"] then return end
        local target = getClosestEnemy(500)
        if not target then return end
        local hrp = target:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local cam    = workspace.CurrentCamera
        local smooth = Settings.camLockSmoothness or 0.35
        pcall(function()
            local goal = CFrame.new(cam.CFrame.Position, hrp.Position + Vector3.new(0, 1.5, 0))
            cam.CFrame = cam.CFrame:Lerp(goal, smooth)
        end)
    end))

    FeatureCallbacks["CamLock"] = function(v)
        notify("Cam Lock: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  ESP
-- ═══════════════════════════════════════════════════════════════
do
    local espStore = {}
    local rainbowH = 0

    local function cleanESP(player)
        local d = espStore[player]
        if not d then return end
        pcall(function() if d.bb then d.bb:Destroy() end end)
        pcall(function() if d.hl then d.hl:Destroy() end end)
        espStore[player] = nil
    end

    local function buildESP(player)
        if player == LocalPlayer then return end
        cleanESP(player)
        local char = player.Character
        local hrp  = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head"))
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end

        local isFriend = (LocalPlayer.Team and player.Team and LocalPlayer.Team == player.Team)
        local col      = isFriend and Color3.fromRGB(0, 230, 80) or Color3.fromRGB(255, 60, 80)

        local bb = Instance.new("BillboardGui")
        bb.Name, bb.Adornee = "SovereignESP", hrp
        bb.Size         = UDim2.new(0, 200, 0, 42)
        bb.StudsOffset  = Vector3.new(0, 3.2, 0)
        bb.AlwaysOnTop  = true
        bb.MaxDistance  = 100000
        bb.Parent       = hrp

        local lbl = Instance.new("TextLabel", bb)
        lbl.Size                   = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Font                   = Enum.Font.GothamBold
        lbl.TextSize                = 12
        lbl.TextColor3              = col
        lbl.RichText                = true
        lbl.TextStrokeTransparency  = 0
        lbl.TextStrokeColor3        = Color3.new(0, 0, 0)
        local myHrp = getMyHRP()
        local dist  = myHrp and math.floor((hrp.Position - myHrp.Position).Magnitude) or 0
        local hpPct = math.floor((hum.Health / math.max(hum.MaxHealth, 1)) * 100)
        lbl.Text = string.format("<b>%s</b>\n[%dm] HP: %d%%", player.DisplayName, dist, hpPct)

        local hl = Instance.new("Highlight")
        hl.Name              = "SovereignESP_HL"
        hl.Adornee           = char
        hl.DepthMode         = Enum.HighlightDepthMode.AlwaysOnTop
        hl.FillColor         = col
        hl.FillTransparency  = 0.55
        hl.OutlineColor      = col
        hl.OutlineTransparency = 0.1
        hl.Parent            = char

        espStore[player] = { bb = bb, hl = hl, char = char, lbl = lbl }
    end

    local function rebuildESPs()
        for p in pairs(espStore) do cleanESP(p) end
        local anyESP = FeatureStates["PlayerEsp"] or FeatureStates["GeneralEsp"]
                    or FeatureStates["RainbowEsp"] or FeatureStates["SimpleEsp"]
        if anyESP then
            for _, p in ipairs(Players:GetPlayers()) do pcall(buildESP, p) end
        end
    end

    -- Rainbow color update
    registerConnection(RunService.Heartbeat:Connect(function()
        if not FeatureStates["RainbowEsp"] then return end
        rainbowH = (rainbowH + 0.5) % 360
        local col = Color3.fromHSV(rainbowH / 360, 1, 1)
        for _, d in pairs(espStore) do
            pcall(function()
                if d.hl  then d.hl.FillColor, d.hl.OutlineColor = col, col end
                if d.lbl then d.lbl.TextColor3 = col end
            end)
        end
    end))

    -- Periodic label refresh
    task.spawn(function()
        while isCurrentSession() do
            task.wait(0.7)
            if not (FeatureStates["PlayerEsp"] or FeatureStates["GeneralEsp"]
                 or FeatureStates["RainbowEsp"] or FeatureStates["SimpleEsp"]) then
                continue
            end
            local myHrp = getMyHRP()
            for player, d in pairs(espStore) do
                pcall(function()
                    if not player.Character or player.Character ~= d.char then
                        cleanESP(player); pcall(buildESP, player); return
                    end
                    local hrp = d.char:FindFirstChild("HumanoidRootPart")
                    local hum = d.char:FindFirstChildOfClass("Humanoid")
                    if not hrp or not hum then return end
                    local dist  = myHrp and math.floor((hrp.Position - myHrp.Position).Magnitude) or 0
                    local hpPct = math.floor((hum.Health / math.max(hum.MaxHealth, 1)) * 100)
                    if d.lbl and d.lbl.Parent then
                        d.lbl.Text = string.format(
                            "<b>%s</b>\n[%dm] HP: %d%%", player.DisplayName, dist, hpPct
                        )
                    end
                end)
            end
        end
    end)

    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function()
            task.wait(0.4)
            if FeatureStates["PlayerEsp"] or FeatureStates["GeneralEsp"]
            or FeatureStates["RainbowEsp"] or FeatureStates["SimpleEsp"] then
                pcall(buildESP, p)
            end
        end)
    end)
    Players.PlayerRemoving:Connect(cleanESP)

    for _, id in ipairs({"PlayerEsp","GeneralEsp","RainbowEsp","SimpleEsp","NpcEsp","FruitEsp"}) do
        FeatureCallbacks[id] = function(v)
            rebuildESPs()
            notify(id .. ": " .. (v and "ON" or "OFF"), v)
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
--  WALK SPEED
-- ═══════════════════════════════════════════════════════════════
do
    registerConnection(RunService.Heartbeat:Connect(function()
        if not FeatureStates["WalkSpeed"] then return end
        pcall(function()
            local char = LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hum or not hrp or hum.Health <= 0 then return end
            local sp = tonumber(Settings.walkSpeed) or 216
            if hum.WalkSpeed ~= sp then hum.WalkSpeed = sp end
            if sp > 20 and hum.MoveDirection.Magnitude > 0.05 then
                local mv = hum.MoveDirection.Unit
                local cv = hrp.AssemblyLinearVelocity
                hrp.AssemblyLinearVelocity = Vector3.new(mv.X * sp, cv.Y, mv.Z * sp)
            end
        end)
    end))

    FeatureCallbacks["WalkSpeed"] = function(v)
        if not v then
            pcall(function()
                local char = LocalPlayer.Character
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = 16 end
            end)
        end
        notify("Speed Hack: " .. (v and "ON (spd=" .. Settings.walkSpeed .. ")" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  NO CLIP
-- ═══════════════════════════════════════════════════════════════
do
    local noClipConn = nil
    FeatureCallbacks["NoClip"] = function(v)
        if noClipConn then pcall(function() noClipConn:Disconnect() end); noClipConn = nil end
        if v then
            noClipConn = RunService.Stepped:Connect(function()
                if not FeatureStates["NoClip"] then return end
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char then return end
                    for _, p in pairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = false end
                    end
                end)
            end)
        end
        notify("No Clip: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  SUPER JUMP
-- ═══════════════════════════════════════════════════════════════
do
    local jumpConn = nil
    FeatureCallbacks["SuperJump"] = function(v)
        if jumpConn then pcall(function() jumpConn:Disconnect() end); jumpConn = nil end
        if v then
            jumpConn = UserInputService.JumpRequest:Connect(function()
                if not FeatureStates["SuperJump"] then return end
                pcall(function()
                    local char = LocalPlayer.Character
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local jh = tonumber(Settings.superJumpHeight) or 500
                        local cv = hrp.AssemblyLinearVelocity
                        hrp.AssemblyLinearVelocity = Vector3.new(cv.X, jh * 0.22, cv.Z)
                    end
                end)
            end)
        end
        notify("Super Jump: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  BUNNY HOP
-- ═══════════════════════════════════════════════════════════════
do
    FeatureCallbacks["BunnyHop"] = function(v)
        notify("Bunny Hop: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  WALK ON WATER
-- ═══════════════════════════════════════════════════════════════
do
    FeatureCallbacks["WalkOnWater"] = function(v)
        pcall(function()
            local waterPlane = workspace:FindFirstChild("Map")
                           and workspace.Map:FindFirstChild("WaterBase-Plane")
            if waterPlane then
                waterPlane.CanCollide = v
                if v then waterPlane.Size = Vector3.new(2000, 1, 2000) end
            end
        end)
        notify("Walk on Water: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  HITBOX EXPANDER
-- ═══════════════════════════════════════════════════════════════
do
    local HBEnabled  = false
    local OrigProps  = {}
    local HBSize     = Vector3.new(25, 25, 25)
    _G.SpookyHitbox  = { Enabled = false, Size = HBSize }

    local function expandModel(model)
        if not model or model == LocalPlayer.Character then return end
        local hum = model:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end
        local head = model:FindFirstChild("Head")
        if head and head:IsA("BasePart") and not OrigProps[head] then
            OrigProps[head] = { Size = head.Size, Transparency = head.Transparency }
            pcall(function()
                head.Size         = HBSize
                head.Transparency = 1
                head.CanCollide   = false
                head.Massless     = true
            end)
        end
    end

    local function restoreAll()
        for part, orig in pairs(OrigProps) do
            pcall(function()
                part.Size        = orig.Size
                part.Transparency = orig.Transparency
            end)
        end
        OrigProps = {}
    end

    task.spawn(function()
        while isCurrentSession() do
            task.wait(0.4)
            if HBEnabled then
                pcall(function()
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then expandModel(p.Character) end
                    end
                end)
            end
        end
    end)

    FeatureCallbacks["HitboxExpander"] = function(v)
        HBEnabled = v
        _G.SpookyHitbox.Enabled = v
        if not v then restoreAll() end
        notify("Hitbox Expander: " .. (v and "ENABLED" or "DISABLED"), v)
    end
    FeatureCallbacks["HitboxNPCs"] = function(v)
        notify("Hitbox NPCs: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  MAGNET HEALTH
-- ═══════════════════════════════════════════════════════════════
do
    task.spawn(function()
        while isCurrentSession() do
            task.wait(0.9)
            if FeatureStates["MagnetHealth"] then
                pcall(function()
                    local char = LocalPlayer.Character
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    if not hum or not hrp or hum.Health <= 0 then return end
                    local hpPct = (hum.Health / math.max(hum.MaxHealth, 1)) * 100
                    if hpPct <= (Settings.magnetHp or 40) then
                        hrp.CFrame = CFrame.new(-380.479, 77.22, 255.826)
                        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        notify("Magnet Health: Safe TP!", false)
                    end
                end)
            end
        end
    end)

    FeatureCallbacks["MagnetHealth"] = function(v) notify("Magnet Health: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["MagnetM1"]     = function(v) notify("Magnet M1: "     .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["MagnetNpc"]    = function(v) notify("Magnet NPC: "    .. (v and "ON" or "OFF"), v) end
end

-- ═══════════════════════════════════════════════════════════════
--  ANTI STUN (No Move)
-- ═══════════════════════════════════════════════════════════════
do
    registerConnection(RunService.Heartbeat:Connect(function()
        if not FeatureStates["NoMove"] then return end
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            char:SetAttribute("Stun",    0)
            char:SetAttribute("Stunned", false)
            local hum  = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if hum and hum.WalkSpeed < 16 then hum.WalkSpeed = 16 end
            if root then
                for _, v in ipairs(root:GetChildren()) do
                    if (v:IsA("BodyVelocity") or v:IsA("BodyPosition"))
                       and not v.Name:find("^Sovereign_") then
                        v:Destroy()
                    end
                end
            end
        end)
    end))
    FeatureCallbacks["NoMove"] = function(v) notify("Anti Stun: " .. (v and "ON" or "OFF"), v) end
end

-- ═══════════════════════════════════════════════════════════════
--  AUTO HAKI / V4
-- ═══════════════════════════════════════════════════════════════
do
    FeatureCallbacks["AutoKen"] = function(v)
        Settings.autoKen = v
        if v then
            pcall(function()
                local rem   = ReplicatedStorage:FindFirstChild("Remotes")
                local commF = rem and rem:FindFirstChild("CommF_")
                if commF then commF:InvokeServer("Ken") end
            end)
        end
        notify("Auto Ken: " .. (v and "ON" or "OFF"), v)
    end

    FeatureCallbacks["AutoV4"] = function(v)
        notify("Auto V4: " .. (v and "ON" or "OFF"), v)
        if not v then return end
        task.spawn(function()
            while isCurrentSession() and FeatureStates["AutoV4"] do
                task.wait(0.5)
                pcall(function()
                    local char  = LocalPlayer.Character
                    local hum   = char and char:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health <= 0 then return end
                    local rem   = ReplicatedStorage:FindFirstChild("Remotes")
                    local commF = rem and rem:FindFirstChild("CommF_")
                    if commF then commF:InvokeServer("V4") end
                end)
            end
        end)
    end

    FeatureCallbacks["NoAnimation"] = function(v)
        if v then
            pcall(function()
                local char = LocalPlayer.Character
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                local anim = hum and hum:FindFirstChildOfClass("Animator")
                if anim then
                    for _, t in pairs(anim:GetPlayingAnimationTracks()) do pcall(function() t:Stop() end) end
                end
            end)
        end
        notify("No Animation: " .. (v and "ON" or "OFF"), v)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  FAST ATTACK
-- ═══════════════════════════════════════════════════════════════
do
    task.spawn(function()
        while isCurrentSession() do
            task.wait(0.15)
            if FeatureStates["FastAttack"] then
                pcall(function()
                    local char = LocalPlayer.Character
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    local target = getClosestEnemy(Settings.m1Range or 100)
                    if not target then return end
                    local tHrp = target:FindFirstChild("HumanoidRootPart")
                    if not tHrp then return end
                    faceTarget(tHrp.Position)
                    local rem   = ReplicatedStorage:FindFirstChild("Remotes")
                    local commF = rem and rem:FindFirstChild("CommF_")
                    if commF then pcall(function() commF:InvokeServer("M1", tHrp) end) end
                end)
            end
        end
    end)
    FeatureCallbacks["FastAttack"] = function(v) notify("Fast Attack: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["M1Extender"] = function(v) notify("M1 Extender: " .. (v and "ON" or "OFF"), v) end
end

-- ═══════════════════════════════════════════════════════════════
--  TRACERS
-- ═══════════════════════════════════════════════════════════════
do
    local tracerGui = Instance.new("ScreenGui")
    tracerGui.Name, tracerGui.ResetOnSpawn, tracerGui.IgnoreGuiInset = "SovereignTracers", false, true
    tracerGui.DisplayOrder = 100
    safeParent(tracerGui)
    local tracerLines = {}

    local TRACER_COLORS = {
        Red    = Color3.fromRGB(255, 70, 85),  Orange = Color3.fromRGB(255, 150, 70),
        Purple = Color3.fromRGB(175, 115, 255), Cyan   = Color3.fromRGB(65, 220, 245),
        Green  = Color3.fromRGB(80, 225, 140),  Blue   = Color3.fromRGB(80, 150, 255),
        Yellow = Color3.fromRGB(255, 225, 90),  Pink   = Color3.fromRGB(255, 130, 190),
        White  = Color3.new(1, 1, 1),
    }

    registerConnection(RunService.RenderStepped:Connect(function()
        if not isCurrentSession() then return end
        -- Hide all first
        for _, line in pairs(tracerLines) do
            if line.Parent then line.Visible = false end
        end
        if not (FeatureStates["Tracers1"] or FeatureStates["TracersAll"]) then return end
        local cam = workspace.CurrentCamera
        if not cam then return end
        local vp   = cam.ViewportSize
        local from = Vector2.new(vp.X * 0.5, vp.Y)
        local col  = TRACER_COLORS[Settings.tracerColorName] or TRACER_COLORS.Red

        for _, p in ipairs(Players:GetPlayers()) do
            if isCombatValid(p, 1200) then
                local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local ok, screenPt, vis = pcall(function()
                        return cam:WorldToViewportPoint(hrp.Position)
                    end)
                    if ok and vis and screenPt.Z > 0 then
                        local to  = Vector2.new(screenPt.X, screenPt.Y)
                        local mid = (from + to) * 0.5
                        local len = (to - from).Magnitude
                        local ang = math.deg(math.atan2(to.Y - from.Y, to.X - from.X))
                        local line = tracerLines[p]
                        if not line or not line.Parent then
                            line = Instance.new("Frame", tracerGui)
                            line.AnchorPoint       = Vector2.new(0.5, 0.5)
                            line.BorderSizePixel   = 0
                            line.BackgroundTransparency = 0.15
                            tracerLines[p] = line
                        end
                        line.Position         = UDim2.fromOffset(mid.X, mid.Y)
                        line.Size             = UDim2.fromOffset(len, 1.5)
                        line.Rotation         = ang
                        line.BackgroundColor3 = col
                        line.Visible          = true
                    end
                end
            end
        end
    end))

    Players.PlayerRemoving:Connect(function(p)
        if tracerLines[p] then
            pcall(function() tracerLines[p]:Destroy() end)
            tracerLines[p] = nil
        end
    end)

    for _, id in ipairs({"Tracers1","Tracers2","Tracers3","TracersAll"}) do
        FeatureCallbacks[id] = function(v) notify("Tracers: " .. (v and "ON" or "OFF"), v) end
    end
end

-- ═══════════════════════════════════════════════════════════════
--  SKILL SORU / INFINITY SORU
-- ═══════════════════════════════════════════════════════════════
do
    local FLASH_NAMES  = {"flashstep","soru","dash","blink","shave"}
    local lastSoruTick = 0
    local vim          = nil
    pcall(function() vim = game:GetService("VirtualInputManager") end)

    local function pressKey(kc)
        local v = vim
        if not v then pcall(function() v = game:GetService("VirtualInputManager") end) end
        if not v or not kc then return end
        pcall(function()
            v:SendKeyEvent(true,  kc, false, game)
            task.wait(0.06)
            v:SendKeyEvent(false, kc, false, game)
        end)
    end

    local function executeSkillSoru()
        if not FeatureStates["SkillSoru"] then return end
        local now = tick()
        if now - lastSoruTick < 0.35 then return end
        lastSoruTick = now
        task.spawn(function()
            local d = tonumber(Settings.soruDelay) or 0.30
            if d > 0 then task.wait(d) end
            if not FeatureStates["SkillSoru"] then return end
            local slotMap = { Melee = 1, Fruit = 2, Sword = 3, Gun = 4 }
            local slotNum = slotMap[Settings.soruWeapon or "Fruit"] or 2
            local SLOTS   = {
                Enum.KeyCode.One, Enum.KeyCode.Two,
                Enum.KeyCode.Three, Enum.KeyCode.Four,
            }
            pressKey(SLOTS[slotNum])
            task.wait(0.12)
            local skillKC = Enum.KeyCode[Settings.soruSkill or "Z"]
            if skillKC then pressKey(skillKC) end
        end)
    end
    _G.SpookyExecuteSkillSoru = executeSkillSoru

    local function setupAnimListener(char)
        if not char then return end
        local hum = char:WaitForChild("Humanoid", 5)
        if not hum then return end
        registerConnection(hum.AnimationPlayed:Connect(function(track)
            if not FeatureStates["SkillSoru"] then return end
            local name = string.lower(track.Name or "")
            for _, fn in ipairs(FLASH_NAMES) do
                if name:find(fn) then executeSkillSoru(); break end
            end
        end))
    end
    if LocalPlayer.Character then task.spawn(setupAnimListener, LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(function(c) task.spawn(setupAnimListener, c) end)

    FeatureCallbacks["SkillSoru"]    = function(v) notify("Skill Soru: "    .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["InfinitySoru"] = function(v) notify("Infinity Soru: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["AimbotSoru"]   = function(v) notify("Aimbot Soru: "   .. (v and "ON" or "OFF"), v) end
end

-- ═══════════════════════════════════════════════════════════════
--  VISUAL FEATURES
-- ═══════════════════════════════════════════════════════════════
do
    FeatureCallbacks["Headless"] = function(v)
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local head = char:FindFirstChild("Head")
            if head then
                head.Transparency = v and 1 or 0
                local face = head:FindFirstChild("face")
                if face then face.Transparency = v and 1 or 0 end
            end
            for _, item in ipairs(char:GetChildren()) do
                if item:IsA("Accessory") then
                    local handle = item:FindFirstChild("Handle")
                    if handle then
                        local att = handle:FindFirstChildOfClass("Attachment")
                        local attName = att and att.Name or ""
                        if attName:find("Hat") or attName:find("Hair") or attName:find("Face")
                        or item.AccessoryType == Enum.AccessoryType.Hair
                        or item.AccessoryType == Enum.AccessoryType.Hat then
                            handle.Transparency = v and 1 or 0
                        end
                    end
                end
            end
        end)
        notify("Headless: " .. (v and "ON" or "OFF"), v)
    end

    FeatureCallbacks["GiantMode"] = function(v)
        pcall(function()
            local char = LocalPlayer.Character
            local hum  = char and char:FindFirstChildOfClass("Humanoid")
            if not char or not hum then return end
            if v then
                char:ScaleTo(Settings.giantScale or 5)
                hum.HipHeight = 2 * (Settings.giantScale or 5)
            else
                char:ScaleTo(1)
                hum.HipHeight = 2
            end
        end)
        notify("Giant Mode: " .. (v and "ON" or "OFF"), v)
    end

    -- Shaders
    local fxCC, fxBloom
    FeatureCallbacks["ShadersVisual"] = function(v)
        pcall(function()
            if not fxCC then
                fxCC   = Instance.new("ColorCorrectionEffect", Lighting); fxCC.Name = "Sovereign_CC"
                fxBloom = Instance.new("BloomEffect", Lighting);           fxBloom.Name = "Sovereign_Bloom"
            end
            if v then
                fxCC.Contrast, fxCC.Saturation, fxCC.Brightness = 0.18, 0.22, 0.05
                fxCC.Enabled, fxBloom.Intensity, fxBloom.Enabled = true, 1.2, true
            else
                if fxCC   then fxCC.Enabled   = false end
                if fxBloom then fxBloom.Enabled = false end
            end
        end)
        notify("Shaders: " .. (v and "ON" or "OFF"), v)
    end

    registerConnection(RunService.Heartbeat:Connect(function()
        if FeatureStates["DayTime"] then
            pcall(function()
                if Lighting.ClockTime ~= 12 then Lighting.ClockTime = 12 end
            end)
        end
    end))
    FeatureCallbacks["DayTime"]      = function(v) notify("Daylight: "      .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["Skybox"]       = function(v) notify("Skybox: "        .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["RainbowSkybox"]= function(v) notify("Rainbow Sky: "   .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["ColorFilter"]  = function(v) notify("Color Filter: "  .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["NoObject"]     = function(v) notify("Hide Weapons: "  .. (v and "ON" or "OFF"), v) end

    FeatureCallbacks["SanguineZBoost"] = function(v) notify("Z Boost: "       .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["SanguineBoost"]  = function(v) notify("Sanguine Boost: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["SGGlitch"]       = function(v) notify("SG Glitch: "     .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["AntiLavaShip"]   = function(v) notify("Anti Lava: "     .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["FruitHopServerHop"] = function(v) notify("Fruit Hop: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["AutoStoreFruit"]    = function(v) notify("Auto Store Fruit: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["RaceSave"]          = function(v) notify("Race Save: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["AimShowFOV"]        = function(v) notify("FOV Circle: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["Korblox"]           = function(v) notify("Korblox: "   .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["FruitScale"]        = function(v) notify("Fruit Scale: " .. (v and "ON" or "OFF"), v) end
    FeatureCallbacks["FruitESP"]          = function(v) notify("Fruit ESP: " .. (v and "ON" or "OFF"), v) end
end

-- ═══════════════════════════════════════════════════════════════
--  RACE SAVE
-- ═══════════════════════════════════════════════════════════════
do
    task.spawn(function()
        while isCurrentSession() do
            task.wait(5)
            if FeatureStates["RaceSave"] then
                pcall(function()
                    local char = LocalPlayer.Character
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health <= 0 then return end
                    local hpPct = (hum.Health / math.max(hum.MaxHealth, 1)) * 100
                    if hpPct <= (Settings.raceHp or 35) then
                        local rem   = ReplicatedStorage:FindFirstChild("Remotes")
                        local commF = rem and rem:FindFirstChild("CommF_")
                        if commF then
                            commF:InvokeServer("BlackbeardReward", "Reroll", "1")
                            commF:InvokeServer("BlackbeardReward", "Reroll", "2")
                        end
                    end
                end)
            end
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
--  TEAM AUTO-SELECT (Pirates by default)
-- ═══════════════════════════════════════════════════════════════
task.spawn(function()
    pcall(function()
        local rem   = ReplicatedStorage:WaitForChild("Remotes", 10)
        local commF = rem and rem:WaitForChild("CommF_", 10)
        if not commF then return end
        for _ = 1, 5 do
            if LocalPlayer.Team and LocalPlayer.Team.Name == "Pirates" then break end
            pcall(function() commF:InvokeServer("SetTeam", "Pirates") end)
            task.wait(1)
        end
    end)
end)

-- ═══════════════════════════════════════════════════════════════
--  CLEANUP
-- ═══════════════════════════════════════════════════════════════
local function performShutdown()
    for _, conn in ipairs(ActiveConnections) do
        pcall(function() conn:Disconnect() end)
    end
    table.clear(ActiveConnections)
    pcall(function()
        local guisToKill = {
            "Sovereign_GUI","Sovereign_LoadingGui","SovereignTracers",
            "Sovereign_MobileToggle","SovereignCamLockWidget",
        }
        for _, name in ipairs(guisToKill) do
            local g = TargetParent:FindFirstChild(name)
            if g then g:Destroy() end
        end
    end)
    print("[Sovereign Hub] Shutdown complete.")
end
_G.Spooky_Cleanup = performShutdown
_G.Spooky_Loaded  = true

-- ═══════════════════════════════════════════════════════════════
--  GUI BUILD
-- ═══════════════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "Sovereign_GUI"
ScreenGui.ResetOnSpawn   = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
safeParent(ScreenGui)
Spooky.UI.screen = ScreenGui

-- Main frame
local Main = Instance.new("Frame", ScreenGui)
Main.Name             = "MainFrame"
Main.Size             = UDim2.new(0, 680, 0, 420)
Main.Position         = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint      = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(9, 9, 13)
Main.BorderSizePixel  = 0
Main.ClipsDescendants = false
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Thickness, mainStroke.Color = 1.5, Color3.fromRGB(255, 45, 55)
mainStroke.Transparency = 0.35

-- Title bar
local titleBar = Instance.new("Frame", Main)
titleBar.Name             = "TitleBar"
titleBar.Size             = UDim2.new(1, 0, 0, 38)
titleBar.BackgroundColor3 = Color3.fromRGB(14, 12, 20)
titleBar.BorderSizePixel  = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)
local tg = Instance.new("UIGradient", titleBar)
tg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(180, 30, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 20, 30)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(50, 14, 20)),
})
tg.Rotation = 90

local titleLbl = Instance.new("TextLabel", titleBar)
titleLbl.Size               = UDim2.new(1, -100, 1, 0)
titleLbl.Position           = UDim2.fromOffset(14, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.Font               = Enum.Font.GothamBold
titleLbl.Text               = "SOVEREIGN HUB  v2.0  |  Blox Fruits"
titleLbl.TextSize            = 14
titleLbl.TextColor3          = Color3.fromRGB(255, 255, 255)
titleLbl.TextXAlignment      = Enum.TextXAlignment.Left

-- Close button
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size             = UDim2.fromOffset(28, 28)
closeBtn.Position         = UDim2.new(1, -34, 0.5, -14)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 50)
closeBtn.Font             = Enum.Font.GothamBold
closeBtn.Text             = "X"
closeBtn.TextSize          = 13
closeBtn.TextColor3        = Color3.new(1, 1, 1)
closeBtn.BorderSizePixel   = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
closeBtn.MouseButton1Click:Connect(function() Main.Visible = false end)

-- Minimise button
local minBtn = Instance.new("TextButton", titleBar)
minBtn.Size             = UDim2.fromOffset(28, 28)
minBtn.Position         = UDim2.new(1, -66, 0.5, -14)
minBtn.BackgroundColor3 = Color3.fromRGB(55, 50, 70)
minBtn.Font             = Enum.Font.GothamBold
minBtn.Text             = "-"
minBtn.TextSize          = 16
minBtn.TextColor3        = Color3.new(1, 1, 1)
minBtn.BorderSizePixel   = 0
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in pairs(Main:GetChildren()) do
        if child.Name ~= "TitleBar" and child:IsA("GuiObject") then
            child.Visible = not minimized
        end
    end
    Main.Size = minimized and UDim2.new(0, 680, 0, 38) or UDim2.new(0, 680, 0, 420)
end)

-- Drag
do
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos  = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Nav bar (left side)
local navFrame = Instance.new("Frame", Main)
navFrame.Name             = "NavBar"
navFrame.Size             = UDim2.new(0, 118, 1, -40)
navFrame.Position         = UDim2.fromOffset(0, 38)
navFrame.BackgroundColor3 = Color3.fromRGB(11, 10, 16)
navFrame.BorderSizePixel  = 0
Instance.new("UICorner", navFrame).CornerRadius = UDim.new(0, 10)
local navLayout = Instance.new("UIListLayout", navFrame)
navLayout.SortOrder = Enum.SortOrder.LayoutOrder
navLayout.Padding   = UDim.new(0, 3)
local navPad = Instance.new("UIPadding", navFrame)
navPad.PaddingTop, navPad.PaddingLeft, navPad.PaddingRight, navPad.PaddingBottom =
    UDim.new(0, 5), UDim.new(0, 5), UDim.new(0, 5), UDim.new(0, 5)

-- Page container (right side)
local pageContainer = Instance.new("Frame", Main)
pageContainer.Name                = "PageContainer"
pageContainer.Size                = UDim2.new(1, -124, 1, -42)
pageContainer.Position            = UDim2.fromOffset(122, 40)
pageContainer.BackgroundTransparency = 1
pageContainer.BorderSizePixel     = 0
pageContainer.ClipsDescendants    = true

-- Accent colour
local ACC = Color3.fromRGB(255, 45, 55)
local pages = {}

-- ── Nav button ────────────────────────────────────────────────
local function makeNavBtn(name, icon, order)
    local btn = Instance.new("TextButton", navFrame)
    btn.Name             = "Nav_" .. name
    btn.LayoutOrder      = order
    btn.Size             = UDim2.new(1, 0, 0, 33)
    btn.BackgroundColor3 = Color3.fromRGB(19, 17, 26)
    btn.Font             = Enum.Font.GothamBold
    btn.Text             = icon .. " " .. name
    btn.TextSize          = 11
    btn.TextColor3        = Color3.fromRGB(175, 170, 195)
    btn.TextXAlignment    = Enum.TextXAlignment.Left
    btn.BorderSizePixel   = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    local pad = Instance.new("UIPadding", btn); pad.PaddingLeft = UDim.new(0, 8)
    local stk = Instance.new("UIStroke", btn)
    stk.Color, stk.Thickness, stk.Transparency = Color3.fromRGB(48, 44, 62), 1, 0.65
    return btn
end

-- ── Scroll page ───────────────────────────────────────────────
local function makeScrollPage(pageName)
    local page = Instance.new("ScrollingFrame", pageContainer)
    page.Name                   = pageName
    page.Size                   = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel        = 0
    page.ScrollBarThickness     = 3
    page.ScrollBarImageColor3   = Color3.fromRGB(255, 45, 55)
    page.CanvasSize             = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize    = Enum.AutomaticSize.Y
    page.Visible                = false
    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding   = UDim.new(0, 6)
    local pad = Instance.new("UIPadding", page)
    pad.PaddingTop, pad.PaddingLeft, pad.PaddingRight, pad.PaddingBottom =
        UDim.new(0, 6), UDim.new(0, 6), UDim.new(0, 6), UDim.new(0, 6)
    pages[pageName] = page
    return page
end

-- ── Show page ─────────────────────────────────────────────────
local function showPage(name)
    for _, p in pairs(pages) do p.Visible = false end
    if pages[name] then pages[name].Visible = true end
    for _, btn in pairs(navFrame:GetChildren()) do
        if btn:IsA("TextButton") then
            local active = (btn.Name == "Nav_" .. name)
            btn.BackgroundColor3 = active and Color3.fromRGB(30, 22, 34) or Color3.fromRGB(19, 17, 26)
            btn.TextColor3       = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(175, 170, 195)
            local stk = btn:FindFirstChildOfClass("UIStroke")
            if stk then
                stk.Transparency = active and 0 or 0.65
                stk.Color        = active and ACC or Color3.fromRGB(48, 44, 62)
            end
        end
    end
end

-- ── Card ──────────────────────────────────────────────────────
local function makeCard(parent, title, layoutOrder)
    local card = Instance.new("Frame", parent)
    -- strip non-ASCII for Instance Name to avoid errors
    card.Name              = "Card_" .. tostring(layoutOrder or 0)
    card.LayoutOrder       = layoutOrder or 0
    card.Size              = UDim2.new(1, -4, 0, 0)
    card.AutomaticSize     = Enum.AutomaticSize.Y
    card.BackgroundColor3  = Color3.fromRGB(15, 14, 20)
    card.BorderSizePixel   = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local stk = Instance.new("UIStroke", card)
    stk.Color, stk.Thickness, stk.Transparency = Color3.fromRGB(48, 44, 66), 1, 0.45

    local hd = Instance.new("TextLabel", card)
    hd.Size               = UDim2.new(1, -12, 0, 22)
    hd.Position           = UDim2.fromOffset(10, 4)
    hd.BackgroundTransparency = 1
    hd.Font               = Enum.Font.GothamBold
    hd.Text               = title
    hd.TextSize            = 11
    hd.TextColor3          = Color3.fromRGB(255, 50, 65)
    hd.TextXAlignment      = Enum.TextXAlignment.Left

    local sep = Instance.new("Frame", card)
    sep.Size             = UDim2.new(1, -20, 0, 1)
    sep.Position         = UDim2.fromOffset(10, 26)
    sep.BackgroundColor3 = Color3.fromRGB(50, 44, 66)
    sep.BorderSizePixel  = 0

    local body = Instance.new("Frame", card)
    body.Name             = "Body"
    body.Size             = UDim2.new(1, -12, 0, 0)
    body.Position         = UDim2.fromOffset(6, 30)
    body.AutomaticSize    = Enum.AutomaticSize.Y
    body.BackgroundTransparency = 1
    body.BorderSizePixel  = 0
    local bl = Instance.new("UIListLayout", body)
    bl.SortOrder = Enum.SortOrder.LayoutOrder
    bl.Padding   = UDim.new(0, 4)
    local pad = Instance.new("UIPadding", body)
    pad.PaddingBottom = UDim.new(0, 8)
    pad.PaddingTop    = UDim.new(0, 4)

    return card, body
end

-- ── Toggle button ─────────────────────────────────────────────
local function makeToggleBtn(parent, featureName, label, layoutOrder)
    local resolvedName = Spooky.ResolveFeature(featureName)

    local row = Instance.new("Frame", parent)
    row.LayoutOrder      = layoutOrder or 0
    row.Size             = UDim2.new(1, 0, 0, 34)
    row.BackgroundColor3 = Color3.fromRGB(19, 17, 26)
    row.BorderSizePixel  = 0
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 7)
    local rs = Instance.new("UIStroke", row)
    rs.Color, rs.Thickness, rs.Transparency = Color3.fromRGB(44, 40, 60), 1, 0.55

    local lbl = Instance.new("TextLabel", row)
    lbl.Size               = UDim2.new(1, -60, 1, 0)
    lbl.Position           = UDim2.fromOffset(12, 0)
    lbl.BackgroundTransparency = 1
    lbl.Font               = Enum.Font.GothamMedium
    lbl.Text               = label
    lbl.TextSize            = 12
    lbl.TextColor3          = Color3.fromRGB(205, 205, 225)
    lbl.TextXAlignment      = Enum.TextXAlignment.Left

    -- Pill toggle
    local pill = Instance.new("Frame", row)
    pill.Size             = UDim2.fromOffset(42, 22)
    pill.Position         = UDim2.new(1, -50, 0.5, -11)
    pill.BackgroundColor3 = Color3.fromRGB(26, 24, 36)
    pill.BorderSizePixel  = 0
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1, 0)
    local ps = Instance.new("UIStroke", pill)
    ps.Color, ps.Thickness = Color3.fromRGB(50, 46, 66), 1

    local knob = Instance.new("Frame", pill)
    knob.Size             = UDim2.fromOffset(16, 16)
    knob.Position         = UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(75, 70, 90)
    knob.BorderSizePixel  = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local function updateVisual(active)
        TweenService:Create(pill, TweenInfo.new(0.18), {
            BackgroundColor3 = active and ACC or Color3.fromRGB(26, 24, 36),
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position         = active and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
            BackgroundColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 70, 90),
        }):Play()
        TweenService:Create(lbl, TweenInfo.new(0.12), {
            TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(205, 205, 225),
        }):Play()
        TweenService:Create(rs, TweenInfo.new(0.12), {
            Color        = active and ACC or Color3.fromRGB(44, 40, 60),
            Transparency = active and 0 or 0.55,
        }):Play()
    end

    -- Invisible full-size click target
    local hitBtn = Instance.new("TextButton", row)
    hitBtn.Size               = UDim2.new(1, 0, 1, 0)
    hitBtn.BackgroundTransparency = 1
    hitBtn.Text               = ""
    hitBtn.ZIndex             = 2
    hitBtn.MouseButton1Click:Connect(function()
        local newState = toggleFeature(featureName)
        updateVisual(newState)
    end)

    -- Reflect current state on creation
    if FeatureStates[resolvedName] then updateVisual(true) end

    return row, updateVisual
end

-- ── Action button ─────────────────────────────────────────────
local function makeActionBtn(parent, label, callback, layoutOrder)
    local btn = Instance.new("TextButton", parent)
    btn.LayoutOrder      = layoutOrder or 0
    btn.Size             = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
    btn.Font             = Enum.Font.GothamBold
    btn.Text             = label
    btn.TextSize          = 11.5
    btn.TextColor3        = Color3.fromRGB(240, 235, 255)
    btn.BorderSizePixel   = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)
    local stk = Instance.new("UIStroke", btn)
    stk.Color, stk.Thickness, stk.Transparency = ACC, 1, 0.4
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {
            BackgroundColor3 = Color3.fromRGB(60, 20, 28),
        }):Play()
        task.delay(0.15, function()
            if btn and btn.Parent then
                TweenService:Create(btn, TweenInfo.new(0.15), {
                    BackgroundColor3 = Color3.fromRGB(22, 18, 32),
                }):Play()
            end
        end)
        if callback then pcall(callback) end
    end)
    return btn
end

-- ── Info label ────────────────────────────────────────────────
local function makeInfoLabel(parent, text, layoutOrder)
    local lbl = Instance.new("TextLabel", parent)
    lbl.LayoutOrder          = layoutOrder or 0
    lbl.Size                 = UDim2.new(1, 0, 0, 22)
    lbl.BackgroundColor3     = Color3.fromRGB(17, 15, 24)
    lbl.Font                 = Enum.Font.GothamMedium
    lbl.Text                 = text
    lbl.TextSize              = 10.5
    lbl.TextColor3            = Color3.fromRGB(175, 175, 195)
    lbl.TextXAlignment        = Enum.TextXAlignment.Left
    lbl.BorderSizePixel       = 0
    lbl.TextTruncate          = Enum.TextTruncate.AtEnd
    Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 5)
    local pad = Instance.new("UIPadding", lbl); pad.PaddingLeft = UDim.new(0, 8)
    return lbl
end

-- ════════════════════════════════════════
--  PAGE DEFINITIONS
-- ════════════════════════════════════════

-- HOME ──────────────────────────────────
do
    local nb = makeNavBtn("Home", "[H]", 1)
    nb.MouseButton1Click:Connect(function() showPage("Home") end)
    local page = makeScrollPage("Home")

    local _, b1 = makeCard(page, "Auto Bounty System", 1)
    makeActionBtn(b1, "START Auto Bounty", function() setFeatureState("AutoBounty", true) end, 1)
    makeActionBtn(b1, "STOP Auto Bounty",  function() setFeatureState("AutoBounty", false) end, 2)
    makeToggleBtn(b1, "AutoBuso", "Auto Buso (Armament Haki)", 3)
    makeToggleBtn(b1, "AutoKen",  "Auto Ken (Observation Haki)", 4)
    makeInfoLabel(b1, "Hunts enemies automatically for bounty gain", 5)

    local _, b2 = makeCard(page, "Kitsune One Shot", 2)
    makeToggleBtn(b2, "OneShotKitsune", "Kitsune One Shot (Fruit M1)", 1)
    makeInfoLabel(b2, "Fires fruit remote at extreme damage value", 2)
    makeInfoLabel(b2, "Requires a Fruit tool to be equipped", 3)

    local _, b3 = makeCard(page, "Quick Toggles", 3)
    makeToggleBtn(b3, "WalkSpeed",     "Speed Hack (spd 216)",    1)
    makeToggleBtn(b3, "SuperJump",     "Super Jump",              2)
    makeToggleBtn(b3, "AimbotPlayer2", "Auto Aim (Continuous)",   3)
    makeToggleBtn(b3, "PlayerEsp",     "Player ESP",              4)
    makeToggleBtn(b3, "HitboxExpander","Hitbox Expander",         5)
end

-- COMBAT ────────────────────────────────
do
    local nb = makeNavBtn("Combat", "[C]", 2)
    nb.MouseButton1Click:Connect(function() showPage("Combat") end)
    local page = makeScrollPage("Combat")

    local _, b1 = makeCard(page, "Kitsune One Shot", 1)
    makeToggleBtn(b1, "OneShotKitsune", "One Shot Kitsune (Fruit M1)", 1)
    makeInfoLabel(b1, "Fires fruit LeftClickRemote with 9e30 damage | needs Fruit", 2)

    local _, b2 = makeCard(page, "Aimbot", 2)
    makeToggleBtn(b2, "AimbotPlayer1", "Aimbot P1 — Face on Skill", 1)
    makeToggleBtn(b2, "AimbotPlayer2", "Aimbot P2 — Always Face",   2)
    makeToggleBtn(b2, "AimbotPlayer3", "Aimbot P3 — Silent Aim",    3)
    makeToggleBtn(b2, "AimbotNpc1",    "Aimbot NPC — On Skill",     4)
    makeToggleBtn(b2, "HitboxExpander","Hitbox Expander",           5)
    makeToggleBtn(b2, "HitboxNPCs",    "Hitbox — NPCs too",         6)

    local _, b3 = makeCard(page, "Cam Lock", 3)
    makeToggleBtn(b3, "CamLock",    "Camera Lock (nearest enemy)", 1)
    makeToggleBtn(b3, "AimbotSoru", "Aimbot Soru",                 2)

    local _, b4 = makeCard(page, "Attack Mods", 4)
    makeToggleBtn(b4, "FastAttack",  "Fast Attack",           1)
    makeToggleBtn(b4, "M1Extender",  "M1 Range Extender",     2)
    makeToggleBtn(b4, "MagnetM1",    "Magnet M1 (Fruit Aura)", 3)
    makeToggleBtn(b4, "MagnetNpc",   "Magnet NPC to you",     4)
    makeToggleBtn(b4, "MagnetHealth","Magnet Health Escape",   5)

    local _, b5 = makeCard(page, "Auto Haki", 5)
    makeToggleBtn(b5, "AutoBuso", "Auto Buso (Armament)", 1)
    makeToggleBtn(b5, "AutoKen",  "Auto Ken (Observation)", 2)
    makeToggleBtn(b5, "AutoV4",   "Auto V4 Race Skill",    3)
end

-- BOUNTY ────────────────────────────────
do
    local nb = makeNavBtn("Bounty", "[B]", 3)
    nb.MouseButton1Click:Connect(function() showPage("Bounty") end)
    local page = makeScrollPage("Bounty")

    local _, b1 = makeCard(page, "Auto Bounty", 1)
    local statusLbl = makeInfoLabel(b1, "Status: Inactive", 1)
    makeActionBtn(b1, "START Auto Bounty (Hunt)", function()
        setFeatureState("AutoBounty", true)
        statusLbl.Text      = "Status: Running — Hunting targets..."
        statusLbl.TextColor3 = Color3.fromRGB(80, 220, 120)
    end, 2)
    makeActionBtn(b1, "STOP Auto Bounty", function()
        setFeatureState("AutoBounty", false)
        statusLbl.Text      = "Status: Stopped"
        statusLbl.TextColor3 = Color3.fromRGB(175, 175, 195)
    end, 3)
    makeToggleBtn(b1, "AutoBuso", "Auto Buso on Respawn", 4)
    makeToggleBtn(b1, "AutoKen",  "Auto Ken Observation", 5)

    -- Live status
    task.spawn(function()
        while isCurrentSession() do
            task.wait(1)
            pcall(function()
                if not FeatureStates["AutoBounty"] then return end
                if not statusLbl or not statusLbl.Parent then return end
                local char = LocalPlayer.Character
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                local hp   = hum and math.floor((hum.Health / math.max(hum.MaxHealth, 1)) * 100) or 0
                local tChar  = getClosestEnemy(800)
                local tPlayer = tChar and Players:GetPlayerFromCharacter(tChar)
                local tName  = (tPlayer and tPlayer.DisplayName) or "Searching..."
                statusLbl.Text = string.format("Running  HP:%d%%  Target: %s", hp, tName)
            end)
        end
    end)

    local _, b2 = makeCard(page, "Bounty Options", 2)
    makeToggleBtn(b2, "RaceSave", "Race Save (reroll on low HP)", 1)
    makeInfoLabel(b2, "Rerolls race ability when below 35% HP", 2)
end

-- ESP ───────────────────────────────────
do
    local nb = makeNavBtn("ESP", "[E]", 4)
    nb.MouseButton1Click:Connect(function() showPage("ESP") end)
    local page = makeScrollPage("ESP")

    local _, b1 = makeCard(page, "Player ESP", 1)
    makeToggleBtn(b1, "PlayerEsp",  "Player ESP (Billboard + Chams)", 1)
    makeToggleBtn(b1, "GeneralEsp", "General ESP (Highlights)",       2)
    makeToggleBtn(b1, "RainbowEsp", "Rainbow ESP",                    3)
    makeToggleBtn(b1, "SimpleEsp",  "Simple ESP",                     4)
    makeToggleBtn(b1, "NpcEsp",     "NPC / Boss ESP",                 5)
    makeToggleBtn(b1, "FruitESP",   "Fruit ESP",                      6)

    local _, b2 = makeCard(page, "Tracers", 2)
    makeToggleBtn(b2, "Tracers1",   "Tracers (Aim target)", 1)
    makeToggleBtn(b2, "TracersAll", "Tracers (All enemies)", 2)

    local _, b3 = makeCard(page, "Aim FOV Circle", 3)
    makeToggleBtn(b3, "AimShowFOV", "Show Aim FOV Circle", 1)
end

-- GLITCHES ──────────────────────────────
do
    local nb = makeNavBtn("Glitches", "[G]", 5)
    nb.MouseButton1Click:Connect(function() showPage("Glitches") end)
    local page = makeScrollPage("Glitches")

    local _, b1 = makeCard(page, "Movement", 1)
    makeToggleBtn(b1, "WalkSpeed",   "Speed Hack (216 spd)",  1)
    makeToggleBtn(b1, "SuperJump",   "Super Jump",            2)
    makeToggleBtn(b1, "BunnyHop",    "Bunny Hop",             3)
    makeToggleBtn(b1, "WalkOnWater", "Walk on Water",         4)
    makeToggleBtn(b1, "NoClip",      "No Clip",               5)
    makeToggleBtn(b1, "NoAnimation", "No Animation",          6)

    local _, b2 = makeCard(page, "Soru / Boosts", 2)
    makeToggleBtn(b2, "InfinitySoru",  "Infinity Soru",                 1)
    makeToggleBtn(b2, "SkillSoru",     "Skill Soru (fires skill on soru)", 2)
    makeToggleBtn(b2, "SanguineZBoost","Z Boost Glitch",                3)
    makeToggleBtn(b2, "SanguineBoost", "Sanguine Z Lag Boost",         4)
    makeToggleBtn(b2, "SGGlitch",      "SG Glitch",                    5)

    local _, b3 = makeCard(page, "Anti-Death", 3)
    makeToggleBtn(b3, "AntiLavaShip", "Anti Lava",                 1)
    makeToggleBtn(b3, "NoMove",       "Anti Stun (No Move)",       2)
    makeToggleBtn(b3, "MagnetHealth", "Magnet Health (HP escape)", 3)
    makeToggleBtn(b3, "RaceSave",     "Race Save",                 4)
end

-- VISUAL ────────────────────────────────
do
    local nb = makeNavBtn("Visual", "[V]", 6)
    nb.MouseButton1Click:Connect(function() showPage("Visual") end)
    local page = makeScrollPage("Visual")

    local _, b1 = makeCard(page, "Character FX", 1)
    makeToggleBtn(b1, "Headless",  "Headless Mode",        1)
    makeToggleBtn(b1, "Korblox",   "Korblox Leg",          2)
    makeToggleBtn(b1, "GiantMode", "Giant Mode (5x Scale)", 3)

    local _, b2 = makeCard(page, "World FX", 2)
    makeToggleBtn(b2, "ShadersVisual","Shaders / Bloom",   1)
    makeToggleBtn(b2, "DayTime",      "Full Daylight",     2)
    makeToggleBtn(b2, "Skybox",       "Custom Skybox",     3)
    makeToggleBtn(b2, "RainbowSkybox","Rainbow Skybox",    4)
    makeToggleBtn(b2, "ColorFilter",  "Color Filter",      5)
    makeToggleBtn(b2, "NoObject",     "Hide Weapons",      6)
end

-- FRUIT ─────────────────────────────────
do
    local nb = makeNavBtn("Fruit", "[F]", 7)
    nb.MouseButton1Click:Connect(function() showPage("Fruit") end)
    local page = makeScrollPage("Fruit")

    local _, b1 = makeCard(page, "Fruit Collector", 1)
    makeToggleBtn(b1, "FruitHopServerHop", "Auto Hop to Fruit Servers", 1)
    makeToggleBtn(b1, "AutoStoreFruit",    "Auto Store Fruit",          2)
    makeToggleBtn(b1, "FruitESP",          "Fruit ESP",                 3)
    makeActionBtn(b1, "Hop Server Now", function()
        if getgenv().FruitHop_HopServer then getgenv().FruitHop_HopServer() end
    end, 4)

    local _, b2 = makeCard(page, "Fruit Glitch", 2)
    makeToggleBtn(b2, "FruitScale", "Giant Fruit Scale (50x)", 1)
    makeToggleBtn(b2, "MagnetM1",   "Magnet M1 (Fruit Aura)", 2)
end

-- SETTINGS ──────────────────────────────
do
    local nb = makeNavBtn("Settings", "[S]", 8)
    nb.MouseButton1Click:Connect(function() showPage("Settings") end)
    local page = makeScrollPage("Settings")

    local _, b1 = makeCard(page, "Spoof", 1)
    makeInfoLabel(b1, "Level Spoof: 2800  |  Bounty: 30M", 1)
    makeActionBtn(b1, "Apply Level Spoof", function()
        setFeatureState("SpoofLevel", true)
    end, 2)

    local _, b2 = makeCard(page, "Script Controls", 2)
    makeActionBtn(b2, "Show / Hide Hub (RShift)", function()
        Main.Visible = not Main.Visible
    end, 1)
    makeActionBtn(b2, "Reload Script", function()
        notify("Reloading...", true)
        task.delay(0.5, performShutdown)
    end, 2)

    local _, b3 = makeCard(page, "About", 3)
    makeInfoLabel(b3, "Sovereign Hub v2.0  |  Blox Fruits PvP Suite", 1)
    makeInfoLabel(b3, "AutoBounty  Kitsune 1-Shot  Aimbot  CamLock", 2)
    makeInfoLabel(b3, "ESP  Hitbox  Glitches  Fruit Hop  Shaders", 3)
    makeInfoLabel(b3, "Toggle: RightShift  |  Mobile: floating [S]", 4)
end

-- ═══════════════════════════════════════
--  MOBILE FLOATING TOGGLE BUTTON
-- ═══════════════════════════════════════
do
    local toggle = Instance.new("ScreenGui")
    toggle.Name, toggle.ResetOnSpawn, toggle.IgnoreGuiInset =
        "Sovereign_MobileToggle", false, true
    toggle.DisplayOrder = 10
    safeParent(toggle)

    local floatBtn = Instance.new("TextButton", toggle)
    floatBtn.Size             = UDim2.fromOffset(46, 46)
    floatBtn.Position         = UDim2.new(0, 10, 0.5, -23)
    floatBtn.BackgroundColor3 = Color3.fromRGB(200, 35, 50)
    floatBtn.Font             = Enum.Font.GothamBold
    floatBtn.Text             = "S"
    floatBtn.TextSize          = 18
    floatBtn.TextColor3        = Color3.new(1, 1, 1)
    floatBtn.BorderSizePixel   = 0
    Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1, 0)
    local fb_stk = Instance.new("UIStroke", floatBtn)
    fb_stk.Color, fb_stk.Thickness, fb_stk.Transparency =
        Color3.fromRGB(255, 255, 255), 1.5, 0.5
    floatBtn.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    -- Drag support for mobile
    local fbDrag, fbDs, fbDp = false, nil, nil
    floatBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            fbDrag, fbDs, fbDp = true, input.Position, floatBtn.Position
        end
    end)
    floatBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then fbDrag = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if fbDrag and input.UserInputType == Enum.UserInputType.Touch and fbDs then
            local delta = input.Position - fbDs
            floatBtn.Position = UDim2.new(
                fbDp.X.Scale, fbDp.X.Offset + delta.X,
                fbDp.Y.Scale, fbDp.Y.Offset + delta.Y
            )
        end
    end)
end

-- RightShift keybind
registerConnection(UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
    end
end))

-- Show default page and make visible
showPage("Home")
Main.Visible = true

-- Done
notify("Sovereign Hub v2.0 loaded!  Press [RShift] to toggle.", true)
print("[Sovereign Hub] All systems ready — AutoBounty, Kitsune One Shot, Aimbot, ESP & more.")

return ScreenGui
