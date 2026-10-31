local selectFunction = select

local function writeVariadicValues(target, idx, ...)
	local va = { ... }

	for i = 1, selectFunction("#", ...) do
		target[idx + i - 1] = va[i]
	end
end

local char = string.char
local byte = string.byte
local sub = string.sub
local bxor = (bit32 or bit).bxor
local concat = table.concat
local insert = table.insert

local function integerToBytes(value, byteCount)
	local sum = nil
	local integerToBytesState = nil
	local secondaryIntegerToBytesState = nil
	local alternateIntegerToBytesState = nil
	local additionalIntegerToBytesState = nil
	local fallbackIntegerToBytesState = nil
	local nestedIntegerToBytesState = nil
	local innerIntegerToBytesState = nil
	local outerIntegerToBytesState = nil
	local previousIntegerToBytesState = nil
	local currentIntegerToBytesState = nil
	local nextIntegerToBytesState = nil
	local sourceIntegerToBytesState = nil
	local integerToBytesData = {}
	local integerToBytesNumber = 1

	for index = 1, #value, integerToBytesNumber do
		local insertFunction = insert
		local charFunction = char
		local bxorFunction = bxor
		local byteResult = byte(sub(value, index, index + 1, sum, integerToBytesState, secondaryIntegerToBytesState, alternateIntegerToBytesState, additionalIntegerToBytesState, fallbackIntegerToBytesState, nestedIntegerToBytesState, innerIntegerToBytesState, outerIntegerToBytesState, previousIntegerToBytesState, currentIntegerToBytesState))
		local byteFunction = byte
		local subFunction = sub
		local integerToBytesNumber = 1 + index % #byteCount

		sum = 1 + index % #byteCount + 1
		insertFunction(integerToBytesData, charFunction(bxorFunction(byteResult, byteFunction(subFunction(byteCount, integerToBytesNumber, sum, integerToBytesState, secondaryIntegerToBytesState, alternateIntegerToBytesState, additionalIntegerToBytesState, fallbackIntegerToBytesState, nestedIntegerToBytesState, innerIntegerToBytesState, outerIntegerToBytesState, previousIntegerToBytesState, currentIntegerToBytesState, nextIntegerToBytesState, sourceIntegerToBytesState))) % 256))
	end

	return concat(integerToBytesData, integerToBytesNumber, i2)
end

local match = string.match
local capturedTonumber = tonumber
local pcallFunction = pcall

local function updatePositionFromInput()
	local state = nil
	local secondaryState = nil
	local alternateState = nil
	local additionalState = nil

	local function updateMouseEnterConnection(parentData)
		local parentState = nil
		local secondaryParentState = nil
		local serviceState = nil
		local secondaryServiceState = nil
		local alternateServiceState = nil
		local additionalServiceState = nil
		local alternateParentState = nil
		local additionalParentState = nil
		local fallbackParentState = nil
		local nestedParentState = nil
		local innerParentState = nil
		local outerParentState = nil
		local previousParentState = nil
		local currentParentState = nil
		local positionState = nil
		local secondaryPositionState = nil
		local dataState = nil
		local secondaryDataState = nil
		local alternateDataState = nil
		local additionalDataState = nil
		local fallbackDataState = nil
		local nestedDataState = nil
		local innerDataState = nil
		local outerDataState = nil
		local previousDataState = nil
		local currentDataState = nil
		local nextDataState = nil
		local sourceDataState = nil
		local targetDataState = nil
		local dataStateVariantA = nil
		local dataStateVariantB = nil
		local dataStateVariantC = nil
		local dataStateVariantD = nil
		local dataStateVariantE = nil
		local dataStateVariantF = nil
		local dataStateVariantG = nil
		local numberState = nil
		local secondaryNumberState = nil
		local alternateNumberState = nil
		local additionalNumberState = nil
		local fallbackNumberState = nil
		local nestedNumberState = nil
		local innerNumberState = nil
		local outerNumberState = nil
		local previousNumberState = nil
		local currentNumberState = nil
		local nextNumberState = nil
		local sourceNumberState = nil
		local targetNumberState = nil
		local numberStateVariantA = nil
		local numberStateVariantB = nil
		local numberStateVariantC = nil
		local numberStateVariantD = nil
		local numberStateVariantE = nil
		local numberStateVariantF = nil
		local numberStateVariantG = nil
		local numberStateVariantH = nil
		local numberStateVariantI = nil
		local numberStateVariantJ = nil
		local numberStateVariantK = nil
		local numberStateVariantL = nil
		local numberStateVariantM = nil
		local numberStateVariantN = nil
		local numberStateVariantO = nil
		local numberStateVariantP = nil
		local numberStateVariantQ = nil
		local numberStateVariantR = nil
		local nameState = nil
		local secondaryNameState = nil
		local alternateNameState = nil
		local additionalNameState = nil
		local fallbackNameState = nil
		local nestedNameState = nil
		local innerNameState = nil
		local outerNameState = nil
		local previousNameState = nil
		local currentNameState = nil
		local nextNameState = nil
		local sourceNameState = nil
		local targetNameState = nil
		local nameStateVariantA = nil
		local nameStateVariantB = nil
		local nameStateVariantC = nil
		local nameStateVariantD = nil
		local nameStateVariantE = nil
		local nameStateVariantF = nil
		local sizeState = nil
		local secondarySizeState = nil
		local numberStateVariantS = nil
		local numberStateVariantT = nil
		local numberStateVariantU = nil
		local numberStateVariantV = nil
		local ipairsResultState = nil
		local secondaryIpairsResultState = nil
		local alternateIpairsResultState = nil
		local resultState = nil
		local secondaryResultState = nil
		local alternateResultState = nil
		local additionalResultState = nil
		local fallbackResultState = nil
		local nestedResultState = nil
		local alternateSizeState = nil
		local additionalSizeState = nil
		local fallbackSizeState = nil
		local nestedSizeState = nil
		local innerSizeState = nil
		local outerSizeState = nil
		local previousSizeState = nil
		local currentSizeState = nil
		local nextSizeState = nil
		local sourceSizeState = nil
		local targetSizeState = nil
		local sizeStateVariantA = nil
		local sizeStateVariantB = nil
		local sizeStateVariantC = nil
		local sizeStateVariantD = nil
		local sizeStateVariantE = nil
		local sizeStateVariantF = nil
		local state = nil
		local secondaryState = nil
		local alternateState = nil
		local additionalState = nil
		local fallbackState = nil
		local nestedState = nil
		local innerState = nil
		local outerState = nil
		local previousState = nil
		local currentState = nil
		local nextState = nil
		local sourceState = nil
		local targetState = nil
		local stateVariantA = nil
		local stateVariantB = nil
		local stateVariantC = nil
		local stateVariantD = nil
		local stateVariantE = nil
		local stateVariantF = nil
		local stateVariantG = nil
		local stateVariantH = nil
		local stateVariantI = nil
		local stateVariantJ = nil
		local stateVariantK = nil
		local stateVariantL = nil
		local stateVariantM = nil
		local stateVariantN = nil
		local stateVariantO = nil
		local stateVariantP = nil
		local stateVariantQ = nil
		local stateVariantR = nil
		local stateVariantS = nil
		local stateVariantT = nil
		local stateVariantU = nil
		local stateVariantV = nil
		local stateVariantW = nil
		local parent

		if not parentData then
			parent = parentData[1]
		else
			local additionalService, service, secondaryService, alternateService, LocalPlayer, size, byteCount, capturedNum, updateHeartbeatConnectionNumber, updateHeartbeatConnectionFlag, connection, updateInstancePropertiesFlag, flag, capturedElapsed, secondaryFlag, flagData, getNameData, eggCmdsModule, getNameFlag, rarityModule, parentOption, secondaryGetNameFlag, conditionData, colorData, textNumber, colorNumber, parentNumber, sizeNumber, capturedInstance, capturedStateFlag, capturedParent, capturedByteCount, secondaryConnection, updateInstancePropertiesNumber, capturedStateResult, differenceNumber, stateNumber, ipairsResult, nameNumber, destroy, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, secondaryParent, alternateParent, additionalParent, onDestroying, fallbackParent, guiObject, sizeResult, textResult, colorResult, onFocusLost, onChildAdded, pcallFunction, numberResult, parentResult, instanceResult, positionResult, cornerRadiusResult, placeholderTextResult, secondarySizeResult, alternateSizeResult, additionalSizeResult, fallbackSizeResult, nestedSizeResult, innerSizeResult, resultNumber, instanceNumber, positionNumber, cornerRadiusNumber, ipairsResultNumber, alternateByteCount, number, secondaryGuiObject, instance, additionalByteCount, alternateGuiObject, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult

			do
				local fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, nameNumberResult, ipairsResultVariantI, ipairsResultVariantJ, ipairsResultVariantK, ipairsResultVariantL, ipairsResultVariantM, outerByteCount

				do
					do
						do
							do
								do
									do
										parent = game:GetService(integerToBytes("\215Pzh<0\244", "B\135<\027\017Y", parentState, secondaryParentState))
										additionalService = game:GetService(integerToBytes("\127\221phmD\222`nwO\220csGO", "$*\174\021\026", secondaryParentState, serviceState, secondaryServiceState))
										service = game:GetService(integerToBytes("\"\"\175}\021%\183G\0192", ".pW\193", serviceState, secondaryServiceState, alternateServiceState, additionalServiceState))
										secondaryService = game:GetService(integerToBytes("\017\174d\179\182F@\173&\175G\171\176W@\190&", "\217C\203\020\223\223%!", secondaryServiceState, alternateServiceState, additionalServiceState, alternateParentState, additionalParentState))
										alternateService = game:GetService(integerToBytes("\186\167Vۥ\165\187\142\173", "\218\237\200$\176\214\213", alternateServiceState, additionalServiceState, alternateParentState, additionalParentState, fallbackParentState, nestedParentState))
										LocalPlayer = parent.LocalPlayer
									end

									parent = LocalPlayer:WaitForChild(integerToBytes("i\248\172\175\209\209~\225\164", "\1639\148\205\214\180", alternateParentState, additionalParentState, fallbackParentState, nestedParentState, innerParentState, outerParentState, previousParentState, currentParentState))
									size = UDim2.new(0, 240, 0, 230, additionalParentState, fallbackParentState, nestedParentState, innerParentState, outerParentState, previousParentState, currentParentState)
									byteCount = UDim2.new(0, 310, 0.45, -100, fallbackParentState, nestedParentState, innerParentState, outerParentState, previousParentState, currentParentState, positionState, secondaryPositionState)
									capturedNum = 300
									updateHeartbeatConnectionNumber = 12
									updateHeartbeatConnectionFlag = false
									connection = nil
									updateInstancePropertiesFlag = false
									flag = false
									capturedElapsed = 0
									secondaryFlag = false
									flagData = {
										[integerToBytes("\t\127\028\205'=\244D-b\v", "6D\022r\157UT\155", dataState, secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE)] = 1,
										[integerToBytes("\230\018\220n\226/\130\200\239\026\215I\247$\128\193", "\164\171s\164=\150J\227", dataState, secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE)] = 14,
										[integerToBytes("\"Q;\252>BF\215\fJ#\253<E\\", "\148c%O\153S22", dataState, secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE)] = 0.85,
										[integerToBytes("~^w}5}\207HO`r\016", "\187-=\022\019|\019", dataState, secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE)] = 0.2,
										[integerToBytes("\138\202\027\029\220\004S˫\211\v\004\251\005", "\170١rm\149b\016", dataState, secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE)] = true
									}
									getNameData = {
										[integerToBytes("0!+u\191", "\020r@X\028\220", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 1,
										[integerToBytes("\018\014߹\247\222", "\221Qa\178Ԙ\176", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 1,
										[integerToBytes("\248\233\030\244\023\192\232\019", "z\173\135}\155", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 2,
										[integerToBytes("\182\192\018\188", "\168\228\161`\217_Q", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 3,
										[integerToBytes("\232\196>Y=e\218\195+", "7\187\177N<O", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 4,
										[integerToBytes("\b\222V\232", "\224M\174?\139&\175", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 5,
										[integerToBytes("\168D_+\138EY<\157", "N\228!8", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 6,
										[integerToBytes("\227g\166\v\140\205", "\229\174\030\210c", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 7,
										[integerToBytes("8\226\149\\\228>", "Y{\141\2301\141]", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 8,
										[integerToBytes("\215x\224\005\030O", "*\147\017\150lp", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 9,
										[integerToBytes("<\163.m\226\252", "\136o\198M\031\135", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 10,
										[integerToBytes("'\029\162D\179\229\027", "\201bi\1996݄w", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 11,
										[integerToBytes("\139\r\138/\000:\187", "\204\217l\227AbU", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 12,
										[integerToBytes("|\209\244\236\"\210Q\215\210\234(", "\160>\163\149\133L", secondaryDataState, alternateDataState, additionalDataState, fallbackDataState, nestedDataState, innerDataState, outerDataState, previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG)] = 13
									}
									eggCmdsModule = nil
									getNameFlag = nil
									rarityModule = nil
									parentOption = nil
									secondaryGetNameFlag = false
									conditionData = {}
									pcall(function()
										local Assets = nil
										local number = 0

										repeat
											if number == 0 then
												local secondaryNumber = 0

												repeat
													if secondaryNumber == 0 then
														eggCmdsModule = require(secondaryService.Library.Client.EggCmds)

														local requireFunction = require

														Assets = secondaryService.Directory.Assets
														getNameFlag = requireFunction(Assets)
														secondaryNumber = 1
													end
												until secondaryNumber == 1

												number = 1
											end

											if number == 1 then
												rarityModule = require(secondaryService.Directory.Rarity)
												pcall(function()
													parentOption = require(secondaryService.Library.Client.Eggs.WorkspaceEggVisibility) or require(secondaryService.Library.Client.WorkspaceEggVisibility)
												end)
												number = 2
											end
										until number == 2

										if rarityModule and rarityModule.Rarities then
											local iterator, state = pairs(rarityModule.Rarities)

											for key, item in iterator, state, Assets do
												conditionData[item] = key
											end
										end

										secondaryGetNameFlag = eggCmdsModule ~= nil
									end)
									colorData = {}
									textNumber = 18
									colorNumber = 18
									colorData[integerToBytes("\244\161\014$\196į\024!\199", "\163\182\192mO", previousDataState, currentDataState, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(18, textNumber, colorNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
									parentNumber = 28
									sizeNumber = 28
									colorData[integerToBytes("\000/\020\204\240\022'\018", "\149TF`\160", textNumber, colorNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(28, parentNumber, sizeNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
								end

								colorNumber = 38
								textNumber = 38
								colorData[integerToBytes("\n\t\026", "\141Xfm", parentNumber, sizeNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(38, colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
								sizeNumber = 75
								parentNumber = 75
								colorData[integerToBytes("\145\\\216t\031/", "\161\2113\170\016z]5", colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(75, sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
								colorNumber = 245
								textNumber = 245
								colorData[integerToBytes("\204\166\187<\254", "H\155\206\210", sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(245, colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
							end

							sizeNumber = 160
							parentNumber = 160
							colorData[integerToBytes("ahU\023", "S&\0264n", colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(160, sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
							colorNumber = 65
							textNumber = 65
							colorData[integerToBytes("|\0225M\127\005&_", "&8wG", sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(65, colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
							sizeNumber = 45
							parentNumber = 45
							colorData[integerToBytes("\208\227W\197 ", "6\147\1438\182E", colorNumber, textNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(45, sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
							colorData[integerToBytes("\245\141\240Z\218\254\142\233L\205", "\191\182\225\159)", sizeNumber, parentNumber, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA)] = Color3.fromRGB(70, 70, 70, nextDataState, sourceDataState, targetDataState, dataStateVariantA, dataStateVariantB, dataStateVariantC, dataStateVariantD, dataStateVariantE, dataStateVariantF, dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD)
						end

						capturedInstance = nil
						capturedStateFlag = nil
						capturedParent = nil
						capturedByteCount = nil
						secondaryConnection = nil
						updateInstancePropertiesNumber = 0
						capturedStateResult = nil
						differenceNumber = 0
						stateNumber = 4
						colorNumber, textNumber, ipairsResult, sizeNumber, parentNumber, nameNumber, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount = ipairs({
							integerToBytes("\027\0261F\130\132\209\025\019/Q\132\139\206\f'\001", "\162KrH5\235\231", dataStateVariantG, numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD, numberStateVariantE, numberStateVariantF, numberStateVariantG, numberStateVariantH, numberStateVariantI, numberStateVariantJ, numberStateVariantK, numberStateVariantL, numberStateVariantM, numberStateVariantN, numberStateVariantO, numberStateVariantP, numberStateVariantQ, numberStateVariantR, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState),
							integerToBytes("\1749W\246v\005\139\025w\210", "b\236\\$\1303", numberState, secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD, numberStateVariantE, numberStateVariantF, numberStateVariantG, numberStateVariantH, numberStateVariantI, numberStateVariantJ, numberStateVariantK, numberStateVariantL, numberStateVariantM, numberStateVariantN, numberStateVariantO, numberStateVariantP, numberStateVariantQ, numberStateVariantR, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState),
							integerToBytes("\133\f\024\181v\188\1761\168;\t\169Q\141\1787", "P\196yl\218%\200\213", secondaryNumberState, alternateNumberState, additionalNumberState, fallbackNumberState, nestedNumberState, innerNumberState, outerNumberState, previousNumberState, currentNumberState, nextNumberState, sourceNumberState, targetNumberState, numberStateVariantA, numberStateVariantB, numberStateVariantC, numberStateVariantD, numberStateVariantE, numberStateVariantF, numberStateVariantG, numberStateVariantH, numberStateVariantI, numberStateVariantJ, numberStateVariantK, numberStateVariantL, numberStateVariantM, numberStateVariantN, numberStateVariantO, numberStateVariantP, numberStateVariantQ, numberStateVariantR, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState)
						})

						for _, byteCount in colorNumber, textNumber, ipairsResult do
							nameNumber = 0

							while nameNumber ~= 0 do
							end

							destroyNumber = parent
							nestedByteCount = byteCount
							fallbackByteCount = parent.FindFirstChild(destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB)
							destroy = fallbackByteCount

							if destroy then
								destroyNumber = destroy
								fallbackByteCount = destroy.Destroy
								fallbackByteCount(destroyNumber)
							end
						end

						secondaryParent = Instance.new(integerToBytes("3p\016zN\000\173\021z", "\234`\019b\031+n", v293, nameNumber, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState))
						secondaryParent.Name = integerToBytes("6\023Kԥq\1524\030Uã~\135!*{", "\235f\1272\167\204\018", v293, nameNumber, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState)
						secondaryParent.ResetOnSpawn = false
						secondaryParent.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						secondaryParent.Parent = parent
						alternateParent = Instance.new(integerToBytes("v\179\244.A", "N0\193\149C$", nameNumber, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState))
						alternateParent.Name = integerToBytes("\029\031\137\022", "!P~\224x", nameNumber, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState)
						alternateParent.Size = size
						alternateParent.Position = byteCount
						alternateParent.BackgroundColor3 = colorData.Background
						alternateParent.BorderSizePixel = 0
						alternateParent.Active = true
						alternateParent.Parent = secondaryParent
						byteCount = "<\140\200c\164"
						Instance.new(integerToBytes("ف \203N\226\173\017", byteCount, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState), alternateParent, byteCount, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState).CornerRadius = UDim.new(0, 10, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState)
						byteCount = "\194\231\148dF"
						size = Instance.new(integerToBytes("\178\22172\176\136\255\001", byteCount, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState), alternateParent, byteCount, destroy, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState)
						size.Color = colorData.Border
						size.Thickness = 1.5
						size = Instance.new(integerToBytes("`^\192\174\243", "\168&,\161Ö", fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState))
						size.Name = integerToBytes("\180\245\150z5ʷ\004", "v\224\156\226\022P\136\214", fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState)
						destroyNumber = 36
						size.Size = UDim2.new(1, 0, 0, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState)
						size.BackgroundColor3 = colorData.TitleBar
						size.BorderSizePixel = 0
						size.Parent = alternateParent
						fallbackByteCount = "\224\"\1429"
						Instance.new(integerToBytes("w\199z\143P\224\\\146", fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState), size, fallbackByteCount, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState).CornerRadius = UDim.new(0, 10, destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState)
					end

					fallbackByteCount = Instance.new(integerToBytes("\248\181\196\208v", "n\190ǥ\189\019\145=", destroyNumber, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState))
					fallbackByteCount.Size = UDim2.new(1, 0, 0, 12, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState)
					nestedByteCount = -12
					fallbackByteCount.Position = UDim2.new(0, 0, 1, nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState)
					fallbackByteCount.BackgroundColor3 = colorData.TitleBar
					fallbackByteCount.BorderSizePixel = 0
					fallbackByteCount.Parent = size
					fallbackByteCount = Instance.new(integerToBytes("\238\238o\252\167\198\216\238{", "\167\186\139\023\136\235", nestedByteCount, secondaryNameNumber, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState))
					fallbackByteCount.Size = UDim2.new(1, -45, 1, 0, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB)
					secondaryNameNumber = 0
					nestedByteCount = 0
					fallbackByteCount.Position = UDim2.new(0, 12, secondaryNameNumber, nestedByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB)
					fallbackByteCount.BackgroundTransparency = 1
					fallbackByteCount.Text = integerToBytes(";\173\157\031Z\134\156\b\027\185\200\f\020\245\173\n\029", "mz\213\232", secondaryNameNumber, nestedByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState)
					fallbackByteCount.TextColor3 = colorData.White
					fallbackByteCount.Font = Enum.Font.GothamBold
					fallbackByteCount.TextSize = 15
					fallbackByteCount.TextXAlignment = Enum.TextXAlignment.Left
					fallbackByteCount.Parent = size
					additionalParent = Instance.new(integerToBytes("\218\242\186$\204\226\182$\225\249", "P\142\151\194", nestedByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB))
					additionalParent.Size = UDim2.new(0, 28, 0, 28, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD)
					alternateNameNumber = 4
					additionalParent.Position = UDim2.new(1, -31, 0, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD)
					additionalParent.BackgroundColor3 = colorData.Close
					additionalParent.Text = "×"
					additionalParent.TextColor3 = colorData.White
					additionalParent.Font = Enum.Font.GothamBold
					additionalParent.TextSize = 18
					additionalParent.BorderSizePixel = 0
					additionalParent.Parent = size
					nestedByteCount = ",c\166\023"
					fallbackByteCount = 6
					Instance.new(integerToBytes("6\239TC\017\200r^", nestedByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD), additionalParent, nestedByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB).CornerRadius = UDim.new(0, fallbackByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD)
					additionalParent.MouseEnter:Connect(function()
						additionalParent.BackgroundColor3 = colorData.CloseHover
					end, fallbackByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB)
					additionalParent.MouseLeave:Connect(function()
						additionalParent.BackgroundColor3 = colorData.Close
					end, fallbackByteCount, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB)

					function onDestroying()
						local byteCount = nil
						local secondaryByteCount = nil
						local firstChildState = nil
						local secondaryFirstChildState = nil
						local alternateFirstChildState = nil
						local additionalFirstChildState = nil
						local fallbackFirstChildState = nil
						local nestedFirstChildState = nil

						updateInstancePropertiesFlag = false
						flag = false
						secondaryFlag = false

						if connection then
							while 0 ~= 0 do
							end

							connection:Disconnect()
							connection = nil
						end

						if capturedByteCount then
							while 0 ~= 0 do
							end

							while 0 ~= 0 do
							end

							capturedByteCount:Disconnect()
							capturedByteCount = nil
						end

						if secondaryConnection then
							while 0 ~= 0 do
							end

							while 0 ~= 0 do
							end

							secondaryConnection:Disconnect()
							secondaryConnection = nil
						end

						if capturedInstance then
							while 0 ~= 0 do
							end

							capturedInstance:Destroy()
							capturedInstance = nil
						end

						local Character = LocalPlayer.Character

						if Character then
							local number = 0

							while number ~= 1 do
								if number == 0 then
									local secondaryNumber = 0

									repeat
										if secondaryNumber == 0 then
											secondaryByteCount = "\022\147cIp\2268x"

											local firstChild = Character:FindFirstChild(integerToBytes("\209\006:\004\167_\031S\1923\022$\144Y\027s\225", secondaryByteCount, firstChildState, secondaryFirstChildState, alternateFirstChildState, additionalFirstChildState, fallbackFirstChildState, nestedFirstChildState))

											if firstChild then
												firstChild:Destroy()
											end

											secondaryNumber = 1
										end
									until secondaryNumber == 1

									number = 1
								end
							end

							byteCount = "\196\028\151IVS"

							local firstChild = Character:FindFirstChild(integerToBytes("^\242:\"\022\163{\210\026\006\f\148p\24603!\133h\227(5;\169y\249=", byteCount, secondaryByteCount, firstChildState, secondaryFirstChildState, alternateFirstChildState, additionalFirstChildState), true, byteCount, secondaryByteCount, firstChildState)

							if firstChild then
								firstChild:Destroy()
							end
						end

						if capturedParent then
							while 0 ~= 0 do
							end

							local alternateByteCount = "\237\216\021\130\149"
							local firstChild = capturedParent:FindFirstChild(integerToBytes("\154p\241ᨿr\199ƽ\135P\229\242\172\172a\227\246\133\181p\236\225", alternateByteCount, byteCount, secondaryByteCount, firstChildState, secondaryFirstChildState), true, alternateByteCount, byteCount)

							if firstChild then
								firstChild:Destroy()
							end
						end

						capturedStateFlag = nil
						capturedParent = nil
						capturedStateResult = nil
					end

					additionalParent.MouseButton1Click:Connect(function()
						while 0 ~= 0 do
						end

						while 0 ~= 0 do
						end

						onDestroying()
						secondaryParent:Destroy()
					end, alternateNameNumber, onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD)
					fallbackParent = Instance.new(integerToBytes("\164\\^R\181", ">\226.??Щ", onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF))
					fallbackParent.Name = integerToBytes("\201\016F\151", ">\133y5\227\127mO", onMouseEnter, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF)
					fallbackParent.Size = UDim2.new(1, -20, 1, -48, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState)
					paddingNumber = 45
					fallbackParent.Position = UDim2.new(0, 10, 0, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState)
					fallbackParent.BackgroundTransparency = 1
					fallbackParent.Parent = alternateParent
					onMouseEnter = Instance.new(integerToBytes("%=\030\252ź\142\017\r=\224\194", "\194ptR\149\182\206", paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState))
					onMouseEnter.Padding = UDim.new(0, 7, paddingNumber, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState)
					onMouseEnter.SortOrder = Enum.SortOrder.LayoutOrder
					onMouseEnter.Parent = fallbackParent

					function onMouseEnter(text, layoutOrder)
						local parent = nil
						local byteCount = nil
						local sizeNumber = nil
						local sizeState = nil
						local secondarySizeState = nil
						local alternateSizeState = nil
						local additionalSizeState = nil
						local fallbackSizeState = nil
						local nestedSizeState = nil
						local innerSizeState = nil
						local outerSizeState = nil
						local number = 0
						local secondaryParent = nil
						local instance = nil
						local secondaryInstance = nil
						local alternateParent = nil

						repeat
							local secondaryNumber = 0

							repeat
								if secondaryNumber == 1 then
									if number == 3 then
										local secondaryNumber = 0

										while secondaryNumber ~= 2 do
											if secondaryNumber == 0 then
												parent = 11
												byteCount = 0
												sizeNumber = 0
												secondaryInstance.Position = UDim2.new(0, parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState)
												secondaryInstance.BackgroundTransparency = 1
												secondaryNumber = 1
											end

											if secondaryNumber == 1 then
												secondaryInstance.Text = text
												secondaryInstance.TextColor3 = colorData.White
												secondaryNumber = 2
											end
										end

										number = 4
									end

									if number == 5 then
										local secondaryNumber = 0

										repeat
											if secondaryNumber == 0 then
												alternateParent = Instance.new(integerToBytes("\r\173T\f\226\247\026-\167B", "nY\200,x\160\130", sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState))
												parent = 54
												byteCount = 0
												sizeNumber = 26
												alternateParent.Size = UDim2.new(0, parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState)
												secondaryNumber = 1
											end

											if secondaryNumber == 1 then
												parent = -63
												byteCount = 0.5
												sizeNumber = -13
												alternateParent.Position = UDim2.new(1, parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState)
												alternateParent.BackgroundColor3 = colorData.DarkGray
												secondaryNumber = 2
											end
										until secondaryNumber == 2

										number = 6
									end

									secondaryNumber = 2
								end

								if secondaryNumber == 2 then
									if number == 6 then
										alternateParent.Text = integerToBytes("\132\229m", "-ˣ+&#*[", parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState)
										alternateParent.TextColor3 = colorData.Gray
										alternateParent.Font = Enum.Font.GothamBold
										alternateParent.TextSize = 11
										number = 7
									end

									if number == 4 then
										local secondaryNumber = 0

										while true do
											if secondaryNumber == 1 then
												secondaryInstance.TextXAlignment = Enum.TextXAlignment.Left
												secondaryInstance.Parent = secondaryParent
												secondaryNumber = 2
											end

											if secondaryNumber == 2 then
												break
											end

											if secondaryNumber == 0 then
												secondaryInstance.Font = Enum.Font.GothamMedium
												secondaryInstance.TextSize = 13
												secondaryNumber = 1
											end
										end

										number = 5
									end

									secondaryNumber = 3
								end

								if secondaryNumber == 0 then
									if number == 1 then
										local secondaryNumber = 0

										repeat
											if secondaryNumber == 0 then
												secondaryParent.LayoutOrder = layoutOrder
												secondaryParent.Parent = fallbackParent
												secondaryNumber = 1
											end

											if secondaryNumber == 1 then
												local secondaryByteCount = "4\178\229\188C\231\201"

												Instance.new(integerToBytes("\231\172\255,\149\167Q\192", secondaryByteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState), secondaryParent, secondaryByteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState).CornerRadius = UDim.new(0, 7, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState)
												byteCount = "CA!0d\151<"
												parent = secondaryParent
												instance = Instance.new(integerToBytes("\020hc\016\229S($", byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState), parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState)
												secondaryNumber = 2
											end
										until secondaryNumber == 2

										number = 2
									end

									if number == 2 then
										instance.Color = Color3.fromRGB(55, 55, 55, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState)
										instance.Thickness = 1
										secondaryInstance = Instance.new(integerToBytes("\235\226\182\204\223\222\229\171\212", "\147\191\135θ", byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState))
										parent = 1
										byteCount = 0
										secondaryInstance.Size = UDim2.new(1, -75, parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState)
										number = 3
									end

									secondaryNumber = 1
								end
							until secondaryNumber == 3

							if number == 0 then
								local secondaryNumber = 0

								while secondaryNumber ~= 2 do
									if secondaryNumber == 1 then
										secondaryParent.BackgroundColor3 = colorData.Row
										secondaryParent.BorderSizePixel = 0
										secondaryNumber = 2
									end

									if secondaryNumber == 0 then
										secondaryParent = Instance.new(integerToBytes("\162:\167\204\221", "\210\228Hơ\1843", sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState))
										parent = 0
										byteCount = 0
										sizeNumber = 38
										secondaryParent.Size = UDim2.new(1, parent, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState)
										secondaryNumber = 1
									end
								end

								number = 1
							end
						until number == 7

						alternateParent.BorderSizePixel = 0
						alternateParent.Parent = secondaryParent

						local secondaryByteCount = "\174V)\147p\019"

						Instance.new(integerToBytes("\003`\208\031a\1923[", secondaryByteCount, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState), alternateParent, secondaryByteCount, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState).CornerRadius = UDim.new(0, 6, byteCount, sizeNumber, sizeState, secondarySizeState, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState)

						return secondaryParent
					end

					innerByteCount = "\203;`\237kEoq"
					paddingNumber, alternateNameNumber, guiObject, fallbackByteCount, nestedByteCount, secondaryNameNumber, destroyNumber, destroy, byteCount, nameNumber, parent, ipairsResult, colorNumber, textNumber, sizeNumber, parentNumber, sizeResult, textResult, colorResult, onFocusLost, onChildAdded, pcallFunction, numberResult, parentResult, instanceResult, positionResult, cornerRadiusResult, placeholderTextResult, secondarySizeResult, alternateSizeResult, additionalSizeResult, fallbackSizeResult, nestedSizeResult, innerSizeResult, resultNumber, instanceNumber, positionNumber, cornerRadiusNumber, ipairsResultNumber, alternateByteCount, number, nameNumberResult, ipairsResultVariantI, ipairsResultVariantJ, ipairsResultVariantK, ipairsResultVariantL, ipairsResultVariantM, outerByteCount = onMouseEnter(integerToBytes("h\016\136\014!O3\178K\001\158\024", innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState, numberStateVariantS, numberStateVariantT, numberStateVariantU, numberStateVariantV), 1, innerByteCount, innerIpairsResult, outerIpairsResult, previousIpairsResult, currentIpairsResult, nextIpairsResult, sourceIpairsResult, targetIpairsResult, ipairsResultVariantA, ipairsResultVariantB, ipairsResultVariantC, ipairsResultVariantD, ipairsResultVariantE, ipairsResultVariantF, ipairsResultVariantG, ipairsResultVariantH, result, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, secondaryByteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, fallbackNameState, nestedNameState, innerNameState, outerNameState, previousNameState, currentNameState, nextNameState, sourceNameState, targetNameState, nameStateVariantA, nameStateVariantB, nameStateVariantC, nameStateVariantD, nameStateVariantE, nameStateVariantF, sizeState, secondarySizeState, numberStateVariantS, numberStateVariantT)
				end

				secondaryByteCount = "\183Dv́Q\144"

				local ipairsResultVariantN, ipairsResultVariantO, ipairsResultVariantP, ipairsResultVariantQ, ipairsResultVariantR, ipairsResultVariantS, ipairsResultVariantT, ipairsResultVariantU, ipairsResultVariantV, ipairsResultVariantW, ipairsResultVariantX, ipairsResultVariantY, ipairsResultVariantZ, ipairsResultVariantAA, ipairsResultVariantAB, ipairsResultVariantAC, ipairsResultVariantAD, ipairsResultVariantAE, ipairsResultVariantAF, ipairsResultVariantAG

				nestedIpairsResult, fallbackIpairsResult, secondaryGuiObject, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, ipairsResultVariantH, ipairsResultVariantG, ipairsResultVariantF, ipairsResultVariantE, ipairsResultVariantD, ipairsResultVariantC, ipairsResultVariantB, ipairsResultVariantA, targetIpairsResult, sourceIpairsResult, nextIpairsResult, currentIpairsResult, previousIpairsResult, outerIpairsResult, innerIpairsResult, innerByteCount, paddingNumber, alternateNameNumber, secondaryNameNumber, nestedByteCount, destroyNumber, fallbackByteCount, ipairsResultVariantN, ipairsResultVariantO, ipairsResultVariantP, ipairsResultVariantQ, ipairsResultVariantR, ipairsResultVariantS, ipairsResultVariantT, ipairsResultVariantU, ipairsResultVariantV, ipairsResultVariantW, ipairsResultVariantX, ipairsResultVariantY, ipairsResultVariantZ, ipairsResultVariantAA, ipairsResultVariantAB, ipairsResultVariantAC, ipairsResultVariantAD, ipairsResultVariantAE, ipairsResultVariantAF, ipairsResultVariantAG, instance, additionalByteCount = onMouseEnter(integerToBytes("\006\019\191\245q\213\208#V\137\210\001", secondaryByteCount, destroy, byteCount, nameNumber, parent, ipairsResult, colorNumber, textNumber, sizeNumber, parentNumber, sizeResult, textResult, colorResult, onFocusLost, onChildAdded, pcallFunction, numberResult, parentResult, instanceResult, positionResult, cornerRadiusResult, placeholderTextResult, secondarySizeResult, alternateSizeResult, additionalSizeResult, fallbackSizeResult, nestedSizeResult, innerSizeResult, resultNumber, instanceNumber, positionNumber, cornerRadiusNumber, ipairsResultNumber, alternateByteCount, number, nameNumberResult, ipairsResultVariantI, ipairsResultVariantJ, ipairsResultVariantK, ipairsResultVariantL, ipairsResultVariantM, outerByteCount, numberStateVariantT, numberStateVariantU, numberStateVariantV, ipairsResultState, secondaryIpairsResultState, alternateIpairsResultState, resultState, secondaryResultState, alternateResultState), 2, secondaryByteCount, destroy, byteCount, nameNumber, parent, ipairsResult, colorNumber, textNumber, sizeNumber, parentNumber, sizeResult, textResult, colorResult, onFocusLost, onChildAdded, pcallFunction, numberResult, parentResult, instanceResult, positionResult, cornerRadiusResult, placeholderTextResult, secondarySizeResult, alternateSizeResult, additionalSizeResult, fallbackSizeResult, nestedSizeResult, innerSizeResult, resultNumber, instanceNumber, positionNumber, cornerRadiusNumber, ipairsResultNumber, alternateByteCount, number, nameNumberResult, ipairsResultVariantI, ipairsResultVariantJ, ipairsResultVariantK, ipairsResultVariantL, ipairsResultVariantM, outerByteCount, numberStateVariantT, numberStateVariantU, numberStateVariantV, ipairsResultState, secondaryIpairsResultState, alternateIpairsResultState, resultState)
				outerByteCount = "\226n\205\016\132k"
				ipairsResultVariantM, ipairsResultVariantL, alternateGuiObject, ipairsResultVariantK, ipairsResultVariantJ, ipairsResultVariantI, nameNumberResult, number, alternateByteCount, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult = onMouseEnter(integerToBytes("/\184d\235K\177\026\168q\232K\160\v\190d", outerByteCount, ipairsResultVariantH, ipairsResultVariantG, ipairsResultVariantF, ipairsResultVariantE, ipairsResultVariantD, ipairsResultVariantC, ipairsResultVariantB, ipairsResultVariantA, targetIpairsResult, sourceIpairsResult, nextIpairsResult, currentIpairsResult, previousIpairsResult, outerIpairsResult, innerIpairsResult, innerByteCount, paddingNumber, alternateNameNumber, secondaryNameNumber, nestedByteCount, destroyNumber, fallbackByteCount, ipairsResultVariantN, ipairsResultVariantO, ipairsResultVariantP, ipairsResultVariantQ, ipairsResultVariantR, ipairsResultVariantS, ipairsResultVariantT, ipairsResultVariantU, ipairsResultVariantV, ipairsResultVariantW, ipairsResultVariantX, ipairsResultVariantY, ipairsResultVariantZ, ipairsResultVariantAA, ipairsResultVariantAB, ipairsResultVariantAC, ipairsResultVariantAD, ipairsResultVariantAE, ipairsResultVariantAF, ipairsResultVariantAG, instance, additionalByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, alternateSizeState, additionalSizeState, fallbackSizeState), 3, outerByteCount, ipairsResultVariantH, ipairsResultVariantG, ipairsResultVariantF, ipairsResultVariantE, ipairsResultVariantD, ipairsResultVariantC, ipairsResultVariantB, ipairsResultVariantA, targetIpairsResult, sourceIpairsResult, nextIpairsResult, currentIpairsResult, previousIpairsResult, outerIpairsResult, innerIpairsResult, innerByteCount, paddingNumber, alternateNameNumber, secondaryNameNumber, nestedByteCount, destroyNumber, fallbackByteCount, ipairsResultVariantN, ipairsResultVariantO, ipairsResultVariantP, ipairsResultVariantQ, ipairsResultVariantR, ipairsResultVariantS, ipairsResultVariantT, ipairsResultVariantU, ipairsResultVariantV, ipairsResultVariantW, ipairsResultVariantX, ipairsResultVariantY, ipairsResultVariantZ, ipairsResultVariantAA, ipairsResultVariantAB, ipairsResultVariantAC, ipairsResultVariantAD, ipairsResultVariantAE, ipairsResultVariantAF, ipairsResultVariantAG, instance, additionalByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, alternateSizeState)
			end

			additionalByteCount = Instance.new(integerToBytes("\205\209\225\212D", "!\139\163\128\185", number, alternateByteCount, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState))
			number = 38
			additionalByteCount.Size = UDim2.new(1, 0, 0, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState)
			additionalByteCount.BackgroundColor3 = colorData.Row
			additionalByteCount.BorderSizePixel = 0
			additionalByteCount.LayoutOrder = 4
			additionalByteCount.Parent = fallbackParent
			alternateByteCount = "\19078d"
			Instance.new(integerToBytes("bq'\209EV\001\204", alternateByteCount, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState), additionalByteCount, alternateByteCount, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState).CornerRadius = UDim.new(0, 7, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState)
			alternateByteCount = "\1476\207\\~s\131"
			instance = Instance.new(integerToBytes("c\134\015\n\001\236\248S", alternateByteCount, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState), additionalByteCount, alternateByteCount, number, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState)
			instance.Color = Color3.fromRGB(55, 55, 55, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA)
			instance.Thickness = 1
			instance = Instance.new(integerToBytes("94-i!\127\01549", "\030mQU\029m", ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB))
			instance.Size = UDim2.new(0, 85, 1, 0, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD)
			ipairsResultNumber = 0
			cornerRadiusNumber = 0
			instance.Position = UDim2.new(0, 11, ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD)
			instance.BackgroundTransparency = 1
			instance.Text = integerToBytes("\204aQ\1792\158\202\254}A\179", "\156\159\0174\214V\190", ipairsResultNumber, cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB)
			instance.TextColor3 = colorData.White
			instance.Font = Enum.Font.GothamMedium
			instance.TextSize = 13
			instance.TextXAlignment = Enum.TextXAlignment.Left
			instance.Parent = additionalByteCount

			local nestedParent = Instance.new(integerToBytes("\154ꥨ\140\224\165", "\220Ώ\221", cornerRadiusNumber, positionNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD))

			nestedParent.Size = UDim2.new(0, 125, 0, 26, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF)
			cornerRadiusNumber = -13
			nestedParent.Position = UDim2.new(1, -135, 0.5, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF)
			positionNumber = 30
			nestedParent.BackgroundColor3 = Color3.fromRGB(30, 30, positionNumber, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE)
			nestedParent.BorderSizePixel = 0
			nestedParent.Text = ""
			nestedParent.PlaceholderText = integerToBytes("\181m(\018\220", "\178\230\029Mw\184\172", positionNumber, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD)
			nestedParent.TextColor3 = colorData.White
			nestedParent.PlaceholderColor3 = colorData.Gray
			nestedParent.Font = Enum.Font.Gotham
			nestedParent.TextSize = 12
			nestedParent.ClearTextOnFocus = false
			nestedParent.Parent = additionalByteCount
			additionalByteCount = "\152\149\222j{\023"
			positionNumber = 6
			Instance.new(integerToBytes("\192\151)\020e\246\240\172", additionalByteCount, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF), nestedParent, additionalByteCount, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD).CornerRadius = UDim.new(0, positionNumber, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF)
			nestedParent.FocusLost:Connect(function()
				while 0 ~= 0 do
				end

				local num = tonumber(nestedParent.Text)

				if num then
					capturedNum = num
				end
			end, positionNumber, cornerRadiusNumber, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD)

			local function updateHeartbeatConnection()
				local integerToBytesFunction = nil
				local integerToBytesValue = nil
				local byteCount = nil
				local updateHeartbeatConnectionState = nil
				local secondaryHeartbeatConnectionState = nil
				local alternateHeartbeatConnectionState = nil
				local additionalHeartbeatConnectionState = nil
				local fallbackUpdateHeartbeatConnectionState = nil
				local nestedUpdateHeartbeatConnectionState = nil
				local innerUpdateHeartbeatConnectionState = nil
				local number = 0
				local secondaryHeartbeatConnectionNumber = nil
				local character = nil
				local firstChildOfClass = nil
				local findFirstChild = nil

				while true do
					if number == 0 then
						secondaryHeartbeatConnectionNumber = 0
						character = nil
						number = 1
					end

					if number == 2 then
						break
					end

					if number == 1 then
						firstChildOfClass = nil
						findFirstChild = nil
						number = 2
					end
				end

				while true do
					if secondaryHeartbeatConnectionNumber == 1 then
						local updateHeartbeatConnectionNumber = 0

						repeat
							if updateHeartbeatConnectionNumber == 0 then
								firstChildOfClass = character:FindFirstChildOfClass(integerToBytes("\2453\251B\187\210/\242", "սF\150#", updateHeartbeatConnectionState, secondaryHeartbeatConnectionState, alternateHeartbeatConnectionState, additionalHeartbeatConnectionState, fallbackUpdateHeartbeatConnectionState, nestedUpdateHeartbeatConnectionState, innerUpdateHeartbeatConnectionState))

								local secondaryCharacter = character
								local FindFirstChild = character.FindFirstChild

								integerToBytesFunction = integerToBytes
								integerToBytesValue = "g@y\tAZ}\f}Z{\028\127Tf\028"
								byteCount = "h/5\020"
								findFirstChild = FindFirstChild(secondaryCharacter, integerToBytesFunction(integerToBytesValue, byteCount, updateHeartbeatConnectionState, secondaryHeartbeatConnectionState, alternateHeartbeatConnectionState, additionalHeartbeatConnectionState, fallbackUpdateHeartbeatConnectionState, nestedUpdateHeartbeatConnectionState, innerUpdateHeartbeatConnectionState))
								updateHeartbeatConnectionNumber = 1
							end
						until updateHeartbeatConnectionNumber == 1

						secondaryHeartbeatConnectionNumber = 2
					end

					if secondaryHeartbeatConnectionNumber == 0 then
						local updateHeartbeatConnectionNumber = 0

						while updateHeartbeatConnectionNumber ~= 1 do
							if updateHeartbeatConnectionNumber == 0 then
								character = LocalPlayer.Character

								if not character then
									return
								end

								updateHeartbeatConnectionNumber = 1
							end
						end

						secondaryHeartbeatConnectionNumber = 1
					end

					if secondaryHeartbeatConnectionNumber == 3 then
						break
					end

					if secondaryHeartbeatConnectionNumber == 2 then
						if not firstChildOfClass or not findFirstChild then
							return
						end

						firstChildOfClass.Sit = true
						secondaryHeartbeatConnectionNumber = 3
					end
				end

				if connection then
					while 0 ~= 0 do
					end

					connection:Disconnect()
					connection = nil
				end

				connection = service.Heartbeat:Connect(function()
					local stateNumber = nil
					local updateHeartbeatConnectionState = nil
					local secondaryHeartbeatConnectionState = nil
					local alternateHeartbeatConnectionState = nil
					local additionalHeartbeatConnectionState = nil
					local fallbackUpdateHeartbeatConnectionState = nil
					local number = 0
					local secondaryHeartbeatConnectionNumber = nil
					local moveDirection = nil

					while number ~= 1 do
						if number == 0 then
							secondaryHeartbeatConnectionNumber = 0
							moveDirection = nil
							number = 1
						end
					end

					local AssemblyLinearVelocity = nil

					repeat
						if secondaryHeartbeatConnectionNumber == 0 then
							local number = 0

							while number ~= 1 do
								if number == 0 then
									if not updateHeartbeatConnectionFlag or not character.Parent then
										return
									end

									local secondaryFindFirstChild = findFirstChild
									local new = Vector3.new
									local secondaryHeartbeatConnectionNumber = updateHeartbeatConnectionNumber
									local AssemblyAngularVelocityY = findFirstChild.AssemblyAngularVelocity.Y

									stateNumber = updateHeartbeatConnectionNumber
									secondaryFindFirstChild.AssemblyAngularVelocity = new(secondaryHeartbeatConnectionNumber, AssemblyAngularVelocityY, stateNumber, updateHeartbeatConnectionState, secondaryHeartbeatConnectionState, alternateHeartbeatConnectionState, additionalHeartbeatConnectionState, fallbackUpdateHeartbeatConnectionState)
									number = 1
								end
							end

							secondaryHeartbeatConnectionNumber = 1
						end

						if secondaryHeartbeatConnectionNumber == 1 then
							moveDirection = firstChildOfClass.MoveDirection
							AssemblyLinearVelocity = findFirstChild.AssemblyLinearVelocity
							secondaryHeartbeatConnectionNumber = 2
						end
					until secondaryHeartbeatConnectionNumber == 2

					if not (moveDirection.Magnitude > 0.05) then
						findFirstChild.AssemblyLinearVelocity = Vector3.new(0, AssemblyLinearVelocity.Y, 0, stateNumber, updateHeartbeatConnectionState, secondaryHeartbeatConnectionState, alternateHeartbeatConnectionState)
					else
						local updateHeartbeatConnectionFlag = findFirstChild
						local new = Vector3.new
						local updateHeartbeatConnectionNumber = moveDirection.X * capturedNum
						local AssemblyLinearVelocityY = AssemblyLinearVelocity.Y
						local Z = moveDirection.Z
						local num = capturedNum

						updateHeartbeatConnectionFlag.AssemblyLinearVelocity = new(updateHeartbeatConnectionNumber, AssemblyLinearVelocityY, Z * num, num, updateHeartbeatConnectionState, secondaryHeartbeatConnectionState, alternateHeartbeatConnectionState)
					end
				end, integerToBytesFunction, integerToBytesValue, byteCount, updateHeartbeatConnectionState)
			end
			local function updateInstanceProperties()
				local updateInstancePropertiesState = nil
				local secondaryUpdateInstancePropertiesState = nil
				local alternateUpdateInstancePropertiesState = nil
				local additionalInstancePropertiesState = nil
				local fallbackUpdateInstancePropertiesState = nil
				local nestedUpdateInstancePropertiesState = nil
				local innerUpdateInstancePropertiesState = nil
				local updateInstancePropertiesNumber = 0
				local number = nil
				local character = nil
				local firstChildOfClass = nil
				local firstChild = nil

				repeat
					if updateInstancePropertiesNumber == 1 then
						firstChildOfClass = nil
						firstChild = nil
						updateInstancePropertiesNumber = 2
					end

					if updateInstancePropertiesNumber == 0 then
						number = 0
						character = nil
						updateInstancePropertiesNumber = 1
					end
				until updateInstancePropertiesNumber == 2

				while number ~= 3 do
					if number == 0 then
						local updateInstancePropertiesNumber = 0

						while updateInstancePropertiesNumber ~= 1 do
							if updateInstancePropertiesNumber == 0 then
								if connection then
									while 0 ~= 0 do
									end

									connection:Disconnect()
									connection = nil
								end

								character = LocalPlayer.Character
								updateInstancePropertiesNumber = 1
							end
						end

						number = 1
					end

					if number == 2 then
						local updateInstancePropertiesNumber = 0

						repeat
							if updateInstancePropertiesNumber == 0 then
								firstChild = character:FindFirstChild(integerToBytes("\139Y\140\029\178\000\170H\179\019\179\027\147M\147\b", "o\195,\225|\220", updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState, nestedUpdateInstancePropertiesState, innerUpdateInstancePropertiesState))

								if firstChildOfClass then
									while 0 ~= 0 do
									end

									firstChildOfClass.Sit = false
									firstChildOfClass.Jump = true
								end

								updateInstancePropertiesNumber = 1
							end
						until updateInstancePropertiesNumber == 1

						number = 3
					end

					if number == 1 then
						local updateInstancePropertiesNumber = 0

						while updateInstancePropertiesNumber ~= 1 do
							if updateInstancePropertiesNumber == 0 then
								if not character then
									return
								end

								firstChildOfClass = character:FindFirstChildOfClass(integerToBytes("\240S\rr\165\164\209B", "˸&`\019\203", updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState, nestedUpdateInstancePropertiesState, innerUpdateInstancePropertiesState))
								updateInstancePropertiesNumber = 1
							end
						end

						number = 2
					end
				end

				if firstChild then
					local updateInstancePropertiesNumber = 0
					local AssemblyLinearVelocity = nil

					while updateInstancePropertiesNumber ~= 1 do
						if updateInstancePropertiesNumber == 0 then
							firstChild.AssemblyAngularVelocity = Vector3.zero
							AssemblyLinearVelocity = firstChild.AssemblyLinearVelocity
							updateInstancePropertiesNumber = 1
						end
					end

					firstChild.AssemblyLinearVelocity = Vector3.new(0, AssemblyLinearVelocity.Y, 0, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState, nestedUpdateInstancePropertiesState)
				end
			end

			guiObject.MouseButton1Click:Connect(function()
				local textState = nil
				local secondaryTextState = nil
				local alternateTextState = nil
				local additionalTextState = nil
				local fallbackTextState = nil
				local nestedTextState = nil

				while 0 ~= 0 do
				end

				while 0 ~= 0 do
				end

				updateHeartbeatConnectionFlag = not updateHeartbeatConnectionFlag

				if not updateHeartbeatConnectionFlag then
					while 0 ~= 0 do
					end

					local number = 0

					while number ~= 1 do
						if number == 0 then
							local secondaryNumber = 0

							repeat
								if secondaryNumber == 0 then
									guiObject.Text = integerToBytes("\0004t", "kOr2.\151\231", secondaryTextState, alternateTextState, additionalTextState, fallbackTextState, nestedTextState)
									guiObject.BackgroundColor3 = colorData.DarkGray
									secondaryNumber = 1
								end
							until secondaryNumber == 1

							number = 1
						end
					end

					guiObject.TextColor3 = colorData.Gray
					updateInstanceProperties()
				else
					while 0 ~= 0 do
					end

					local number = 0

					while number ~= 1 do
						if number == 0 then
							guiObject.Text = integerToBytes("\022]", "\174Y\019\025!", textState, secondaryTextState, alternateTextState, additionalTextState)
							guiObject.BackgroundColor3 = colorData.White
							number = 1
						end
					end

					guiObject.TextColor3 = colorData.Background
					updateHeartbeatConnection()
				end
			end, instanceNumber, resultNumber, innerSizeResult, nestedSizeResult, fallbackSizeResult, additionalSizeResult, alternateSizeResult, secondarySizeResult, placeholderTextResult, cornerRadiusResult, positionResult, instanceResult, parentResult, numberResult, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState)

			local function getFlagName(flagNameCallback)
				local getFlagNameCondition = nil
				local searchableText = nil
				local getFlagNameNumber = nil
				local searchQuery = nil
				local rarityCondition = nil
				local valueType = nil
				local bytes = nil
				local integerToBytesValue = nil
				local byteCount = nil
				local getFlagNameText = nil
				local getFlagNameState = nil
				local secondaryGetFlagNameState = nil
				local alternateGetFlagNameState = nil
				local additionalGetFlagNameState = nil
				local fallbackGetFlagNameState = nil
				local nestedGetFlagNameState = nil
				local innerGetFlagNameState = nil
				local outerGetFlagNameState = nil
				local previousGetFlagNameState = nil
				local currentGetFlagNameState = nil
				local nextGetFlagNameState = nil
				local sourceGetFlagNameState = nil
				local number = 0

				repeat
					if number == 1 then
						local str = tostring(flagNameCallback)
						local iterator, state, control, _ = pairs(getNameData)

						for rarity in iterator, state, control do
							searchableText = str
							searchQuery = rarity
							getFlagNameNumber = str.find(searchableText, searchQuery, rarityCondition, valueType, bytes, integerToBytesValue, byteCount, getFlagNameText)

							if getFlagNameNumber then
								return rarity
							end
						end

						number = 2
						getFlagNameCondition = v632
					end

					if number == 0 then
						local secondaryGetFlagNameNumber = 0

						while secondaryGetFlagNameNumber ~= 1 do
							if secondaryGetFlagNameNumber == 0 then
								if not flagNameCallback then
									return integerToBytes("\026\169\184$\1337", "\160Y\198\213I\234Y\215", getFlagNameNumber, searchableText, searchQuery)
								end

								if secondaryGetNameFlag and getNameFlag and getNameFlag.Directory then
									local number = 0
									local secondaryGetFlagNameNumber = nil

									repeat
										if number == 0 then
											secondaryGetFlagNameNumber = 0
											number = 1
										end
									until number == 1

									while secondaryGetFlagNameNumber ~= 0 do
									end

									getFlagNameNumber = getNameFlag.Directory
									getFlagNameCondition = getFlagNameNumber[flagNameCallback]

									if getFlagNameCondition then
										getFlagNameNumber = getFlagNameCondition.Rarity

										if getFlagNameNumber then
											getFlagNameNumber = 0
											searchableText = nil
											searchQuery = nil

											repeat
												if getFlagNameNumber == 0 then
													searchableText = 0
													searchQuery = nil
													getFlagNameNumber = 1
												end
											until getFlagNameNumber == 1

											rarityCondition = nil

											while true do
												if searchableText == 1 then
													local getFlagNameNumber = 0

													repeat
														if getFlagNameNumber == 0 then
															if rarityCondition then
																return rarityCondition
															end

															getFlagNameText = "\165(\017Ԟ"

															if typeof(searchQuery) == integerToBytes("\\p\182\242\192", getFlagNameText, getFlagNameState, secondaryGetFlagNameState, alternateGetFlagNameState, additionalGetFlagNameState, fallbackGetFlagNameState, nestedGetFlagNameState, innerGetFlagNameState, outerGetFlagNameState, previousGetFlagNameState, currentGetFlagNameState, nextGetFlagNameState, sourceGetFlagNameState) then
																getFlagNameText = "F\133\185hS"

																if typeof(searchQuery.Name) == integerToBytes("\246\205\026:(\226", getFlagNameText, getFlagNameState, secondaryGetFlagNameState, alternateGetFlagNameState, additionalGetFlagNameState, fallbackGetFlagNameState, nestedGetFlagNameState, innerGetFlagNameState, outerGetFlagNameState, previousGetFlagNameState, currentGetFlagNameState, nextGetFlagNameState, sourceGetFlagNameState) then
																	return searchQuery.Name
																end
															end

															getFlagNameNumber = 1
														end
													until getFlagNameNumber == 1

													searchableText = 2
												end

												if searchableText == 2 then
													break
												end

												if searchableText == 0 then
													searchQuery = getFlagNameCondition.Rarity
													rarityCondition = conditionData[searchQuery]
													searchableText = 1
												end
											end

											valueType = typeof(searchQuery)
											integerToBytesValue = "\023QV#\199\003"
											byteCount = "\169d%$J"
											bytes = integerToBytes(integerToBytesValue, byteCount, getFlagNameText, getFlagNameState, secondaryGetFlagNameState, alternateGetFlagNameState, additionalGetFlagNameState, fallbackGetFlagNameState, nestedGetFlagNameState, innerGetFlagNameState, outerGetFlagNameState, previousGetFlagNameState, currentGetFlagNameState)

											if valueType == bytes then
												return searchQuery
											end
										end
									end
								end

								secondaryGetFlagNameNumber = 1
							end
						end

						number = 1
					end
				until number == 2

				return integerToBytes("#\136\175]\015\137", "0`\231\194", getFlagNameCondition, getFlagNameNumber)
			end
			local function isFlagNumberValid(text)
				return getNameData[text] or 0
			end
			local function handleResult(parentCallback)
				local integerToBytesValue = nil
				local byteCount = nil
				local integerToBytesFunction = nil
				local resultText = nil
				local secondaryByteCount = nil
				local pcallResult = nil
				local secondaryIntegerToBytesFunction = nil
				local secondaryIntegerToBytesValue = nil
				local alternateByteCount = nil
				local resultState = nil
				local secondaryResultState = nil
				local alternateResultState = nil
				local additionalResultState = nil
				local fallbackResultState = nil
				local nestedResultState = nil
				local innerResultState = nil
				local outerResultState = nil
				local previousResultState = nil
				local currentResultState = nil
				local nextResultState = nil
				local sourceResultState = nil
				local targetResultState = nil
				local resultStateVariantA = nil
				local resultNumber = 0
				local number = nil

				repeat
					if resultNumber == 0 then
						number = 0
						resultNumber = 1
					end
				until resultNumber == 1

				repeat
					local resultNumber = 0

					repeat
						if resultNumber == 0 then
							if number == 1 then
								local resultNumber = 0

								repeat
									if resultNumber == 0 then
										local firstChild = alternateService:FindFirstChild(parentCallback, integerToBytesValue, byteCount, integerToBytesFunction, resultText, secondaryByteCount)

										if firstChild then
											integerToBytesValue = "\229U\n(\021"
											byteCount = "\227\168:nMy\184\207"

											if firstChild:IsA(integerToBytes(integerToBytesValue, byteCount, integerToBytesFunction, resultText, secondaryByteCount, pcallResult, secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount)) then
												return firstChild
											end
										end

										resultNumber = 1
									end
								until resultNumber == 1

								number = 2
							end

							if number == 0 then
								if not parentCallback then
									return nil
								end

								if parentOption and parentOption.ResolveModel then
									local resultNumber = 0
									local number = nil

									while resultNumber ~= 1 do
										if resultNumber == 0 then
											number = 0
											resultNumber = 1
										end
									end

									while number ~= 0 do
									end

									integerToBytesValue, byteCount, integerToBytesFunction, resultText, secondaryByteCount, pcallResult, secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount = pcall(parentOption.ResolveModel, parentCallback, resultText, secondaryByteCount, pcallResult, secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState)

									if integerToBytesValue and byteCount then
										local IsA = byteCount.IsA

										integerToBytesFunction = integerToBytes
										resultText = "V3\187E\189"
										secondaryByteCount = "\197\027\\\223 ѻ\017"
										integerToBytesValue = IsA(byteCount, integerToBytesFunction(resultText, secondaryByteCount, pcallResult, secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState))

										if integerToBytesValue then
											integerToBytesValue = byteCount.Parent

											if integerToBytesValue then
												return byteCount
											end
										end
									end
								end

								number = 1
							end

							resultNumber = 1
						end
					until resultNumber == 1
				until number == 2

				local iterator, state, control, _, _, _ = ipairs(alternateService:GetChildren())

				for _, item in iterator, state, control do
					if item:IsA(integerToBytes("%P\207\255\006M", "\155c?\163", secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, innerResultState, outerResultState)) or item:IsA(integerToBytes("\175ޥ\136\181", "\228\226\177\193\237\217", secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, innerResultState, outerResultState)) then
						local resultNumber = 0
						local number = nil

						repeat
							if resultNumber == 0 then
								number = 0
								resultNumber = 1
							end
						until resultNumber == 1

						while number ~= 0 do
						end

						secondaryIntegerToBytesFunction = parentCallback

						local firstChild = item:FindFirstChild(secondaryIntegerToBytesFunction, secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, innerResultState, outerResultState, previousResultState, currentResultState)

						if firstChild then
							local IsA = firstChild.IsA

							secondaryIntegerToBytesFunction = integerToBytes
							secondaryIntegerToBytesValue = "\025\191'\2278"
							alternateByteCount = "\134T\208C"

							if IsA(firstChild, secondaryIntegerToBytesFunction(secondaryIntegerToBytesValue, alternateByteCount, resultState, secondaryResultState, alternateResultState, additionalResultState, fallbackResultState, nestedResultState, innerResultState, outerResultState, previousResultState, currentResultState, nextResultState, sourceResultState, targetResultState, resultStateVariantA)) then
								return firstChild
							end
						end
					end
				end

				return nil
			end
			local function isUpdateInstancePropertiesFlagValid()
				local state = nil
				local secondaryState = nil
				local alternateState = nil

				while 0 ~= 0 do
				end

				local Character = LocalPlayer.Character

				return Character and Character:FindFirstChild(integerToBytes(";\185\139]\029\163\143X!\163\137H#\173\148H", "<s\204\230", state, secondaryState, alternateState))
			end
			local function isValid()
				local isValidState = nil

				return LocalPlayer:GetAttribute(integerToBytes("\196;\249b\2543\229w\2156\228d\198)\248u\243", "\016\135Z\139", isValidState)) == true
			end
			local function getPosition(getPositionFlag)
				local getPositionState = nil
				local secondaryGetPositionState = nil
				local alternateGetPositionState = nil
				local additionalGetPositionState = nil
				local fallbackGetPositionState = nil
				local getPositionNumber = 0
				local number = nil

				repeat
					if getPositionNumber == 0 then
						number = 0
						getPositionNumber = 1
					end
				until getPositionNumber == 1

				repeat
					if number == 0 then
						if not getPositionFlag then
							return nil
						end

						if getPositionFlag.PrimaryPart then
							return getPositionFlag.PrimaryPart.Position
						end

						number = 1
					end
				until number == 1

				local byteCount = "\0244\020fS.4"
				local firstChildWhichIsA = getPositionFlag:FindFirstChildWhichIsA(integerToBytes("vu\0216~Uj@", byteCount, getPositionState, secondaryGetPositionState, alternateGetPositionState, additionalGetPositionState, fallbackGetPositionState), true, byteCount, getPositionState, secondaryGetPositionState)

				return firstChildWhichIsA and firstChildWhichIsA.Position
			end
			local function handleInstanceProperties()
				local instancePropertiesState = nil
				local secondaryInstancePropertiesState = nil
				local alternateInstancePropertiesState = nil
				local additionalInstancePropertiesState = nil
				local fallbackInstancePropertiesState = nil
				local nestedInstancePropertiesState = nil
				local innerInstancePropertiesState = nil
				local outerInstancePropertiesState = nil
				local previousInstancePropertiesState = nil
				local currentInstancePropertiesState = nil
				local instancePropertiesNumber = 0
				local number = nil
				local character = nil

				while instancePropertiesNumber ~= 1 do
					if instancePropertiesNumber == 0 then
						number = 0
						character = nil
						instancePropertiesNumber = 1
					end
				end

				repeat
					if number == 0 then
						local instancePropertiesNumber = 0

						while instancePropertiesNumber ~= 1 do
							if instancePropertiesNumber == 0 then
								if secondaryConnection then
									while 0 ~= 0 do
									end

									secondaryConnection:Disconnect()
									secondaryConnection = nil
								end

								character = LocalPlayer.Character
								instancePropertiesNumber = 1
							end
						end

						number = 1
					end
				until number == 1

				if character then
					local firstChild = character:FindFirstChild(integerToBytes("\230*20*\195(\004\023?\251\0273%\f\193=", "o\164OAD", instancePropertiesState, secondaryInstancePropertiesState, alternateInstancePropertiesState, additionalInstancePropertiesState))

					if firstChild then
						firstChild:Destroy()
					end

					local byteCount = "\138\166\185\227\190N"
					local secondaryFirstChild = character:FindFirstChild(integerToBytes("\228ܐ\202\v\237\193\252\176\238\017\218\202\216\154\219<\203\210\205\130\221&\231\195ח", byteCount, secondaryInstancePropertiesState, alternateInstancePropertiesState, additionalInstancePropertiesState, fallbackInstancePropertiesState, nestedInstancePropertiesState), true, byteCount, secondaryInstancePropertiesState, alternateInstancePropertiesState)

					if secondaryFirstChild then
						secondaryFirstChild:Destroy()
					end
				end

				if capturedParent then
					local instancePropertiesNumber = 0
					local number = nil

					while instancePropertiesNumber ~= 1 do
						if instancePropertiesNumber == 0 then
							number = 0
							instancePropertiesNumber = 1
						end
					end

					while number ~= 0 do
					end

					local byteCount = "y\171\020\165W2C"
					local firstChild = capturedParent:FindFirstChild(integerToBytes("\233q\214#w$\030\238G\245\bw$\030\234`\2096Q+\020\206z\209", byteCount, additionalInstancePropertiesState, fallbackInstancePropertiesState, nestedInstancePropertiesState, innerInstancePropertiesState, outerInstancePropertiesState, previousInstancePropertiesState, currentInstancePropertiesState), true, byteCount, additionalInstancePropertiesState, fallbackInstancePropertiesState, nestedInstancePropertiesState, innerInstancePropertiesState)

					if firstChild then
						firstChild:Destroy()
					end
				end
			end
			local function updateState(adornee)
				local integerToBytesFunction = nil
				local byteCount = nil
				local updateInstancePropertiesText = nil
				local nameState = nil
				local secondaryNameState = nil
				local alternateNameState = nil
				local additionalNameState = nil
				local updateInstancePropertiesState = nil
				local secondaryUpdateInstancePropertiesState = nil
				local updateState = nil
				local alternateUpdateInstancePropertiesState = nil
				local additionalInstancePropertiesState = nil
				local fallbackUpdateInstancePropertiesState = nil
				local updateStateNumber = 0
				local number = nil
				local parent = nil
				local firstChild = nil
				local instance = nil
				local secondaryInstance = nil
				local alternateInstance = nil

				repeat
					if updateStateNumber == 2 then
						secondaryInstance = nil
						alternateInstance = nil
						updateStateNumber = 3
					end

					if updateStateNumber == 0 then
						number = 0
						parent = nil
						updateStateNumber = 1
					end

					if updateStateNumber == 1 then
						firstChild = nil
						instance = nil
						updateStateNumber = 2
					end
				until updateStateNumber == 3

				while true do
					if number == 4 then
						local updateInstancePropertiesNumber = 0

						repeat
							if updateInstancePropertiesNumber == 0 then
								byteCount = "b\166X\217V\217"
								alternateInstance = Instance.new(integerToBytes("\228=\184;", byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState))
								integerToBytesFunction = "\188\150\150\025a\230"
								alternateInstance.Name = integerToBytes("\212\243j\021\163\219\241\211J1\185\232\228\247z\004\148", integerToBytesFunction, byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState)
								updateInstancePropertiesNumber = 1
							end
						until updateInstancePropertiesNumber == 1

						alternateInstance.Attachment0 = instance
						number = 5
					end

					if number == 8 then
						break
					end

					if number == 1 then
						local updateInstancePropertiesNumber = 0

						while updateInstancePropertiesNumber ~= 1 do
							if updateInstancePropertiesNumber == 0 then
								if not parent then
									return
								end

								firstChild = adornee.PrimaryPart

								if firstChild then
								else
									firstChild = adornee:FindFirstChild(integerToBytes("\212\237+", "E\145\138L\214", nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState))

									if firstChild then
									else
										firstChild = adornee:FindFirstChild(integerToBytes("UȎ\175\182\002R\192\156\135\187\005", "v\016\175\233\233\223", nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState))

										if firstChild then
										else
											local byteCount = "\029\235\228Uێ\235"

											firstChild = adornee:FindFirstChildWhichIsA(integerToBytes("\169\133&\190ފo\159", byteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState), true, byteCount, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState)
										end
									end
								end

								updateInstancePropertiesNumber = 1
							end
						end

						if not firstChild then
							return
						end

						local IsA = firstChild.IsA

						integerToBytesFunction = integerToBytes
						byteCount = "\248\136L\a<\236ȝ"
						updateInstancePropertiesText = "\141\186\233?bl"

						if not IsA(firstChild, integerToBytesFunction(byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState, additionalInstancePropertiesState, fallbackUpdateInstancePropertiesState)) then
							return
						end

						number = 2
					end

					if number == 6 then
						local updateInstancePropertiesNumber = 0

						while updateInstancePropertiesNumber ~= 1 do
							if updateInstancePropertiesNumber == 0 then
								alternateInstance.LightInfluence = 0
								alternateInstance.Width0 = 0.18
								updateInstancePropertiesNumber = 1
							end
						end

						alternateInstance.Width1 = 0.18
						number = 7
					end

					if number == 3 then
						local updateInstancePropertiesNumber = 0

						while updateInstancePropertiesNumber ~= 1 do
							if updateInstancePropertiesNumber == 0 then
								byteCount = "2]\180ڽ\023.G"
								secondaryInstance = Instance.new(integerToBytes("\028\192\174\220tF*W3\192", byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState, updateState, alternateUpdateInstancePropertiesState))
								integerToBytesFunction = "(\190\196;,$\188"
								secondaryInstance.Name = integerToBytes("\252\161HXa\219O\251\151ksa\219O\255\176OMG\212E۪O", integerToBytesFunction, byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState)
								updateInstancePropertiesNumber = 1
							end
						end

						secondaryInstance.Parent = firstChild
						number = 4
					end

					if number == 0 then
						handleInstanceProperties()

						if not adornee then
							return
						end

						parent = isUpdateInstancePropertiesFlagValid()
						number = 1
					end

					if number == 5 then
						alternateInstance.Attachment1 = secondaryInstance
						alternateInstance.FaceCamera = true
						alternateInstance.LightEmission = 1
						number = 6
					end

					if number == 2 then
						integerToBytesFunction = "m\\%\188Ԛ\029"
						instance = Instance.new(integerToBytes("\029Qȵ\249u\0009K\200", integerToBytesFunction, byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState, updateInstancePropertiesState, secondaryUpdateInstancePropertiesState))
						instance.Name = integerToBytes("&\234\183\215\020]\003ʗ\243\014j\b\238\189\198#{\016\251\165\1929W\001\225\176", ":d\143ģQ", integerToBytesFunction, byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState)
						instance.Parent = parent
						number = 3
					end

					if number == 7 then
						local updateInstancePropertiesNumber = 0

						repeat
							if updateInstancePropertiesNumber == 0 then
								alternateInstance.Transparency = NumberSequence.new(0)
								alternateInstance.Segments = 12
								updateInstancePropertiesNumber = 1
							end
						until updateInstancePropertiesNumber == 1

						alternateInstance.Parent = parent
						number = 8
					end
				end

				secondaryConnection = service.RenderStepped:Connect(function(dt)
					local updateInstancePropertiesState = nil
					local updateState = nil
					local secondaryUpdateInstancePropertiesState = nil
					local updateStateNumber = 0

					repeat
						if updateStateNumber == 0 then
							if not updateInstancePropertiesFlag then
								while 0 ~= 0 do
								end

								while 0 ~= 0 do
								end

								handleInstanceProperties()

								return
							end

							if not alternateInstance.Parent or not instance.Parent or not secondaryInstance.Parent or not adornee.Parent then
								while 0 ~= 0 do
								end

								while 0 ~= 0 do
								end

								handleInstanceProperties()

								return
							end

							updateStateNumber = 1
						end
					until updateStateNumber == 1

					updateInstancePropertiesNumber = (updateInstancePropertiesNumber + dt * 0.4) % 1
					alternateInstance.Color = ColorSequence.new(Color3.fromHSV(updateInstancePropertiesNumber, 1, 1, updateInstancePropertiesState, updateState, secondaryUpdateInstancePropertiesState))
				end, integerToBytesFunction, byteCount, updateInstancePropertiesText, nameState, secondaryNameState, alternateNameState, additionalNameState)
			end
			local function handleState()
				while 0 ~= 0 do
				end

				local stateNumber = 0

				while stateNumber ~= 2 do
					if stateNumber == 1 then
						capturedStateFlag = nil
						capturedParent = nil
						stateNumber = 2
					end

					if stateNumber == 0 then
						if capturedInstance and capturedInstance.Parent then
							capturedInstance:Destroy()
						end

						capturedInstance = nil
						stateNumber = 1
					end
				end

				if capturedByteCount then
					while 0 ~= 0 do
					end

					capturedByteCount:Disconnect()
					capturedByteCount = nil
				end

				handleInstanceProperties()
			end
			local function updateRenderSteppedConnection(parent)
				local byteCount = nil
				local connection = nil
				local nameState = nil
				local secondaryNameState = nil
				local alternateNameState = nil
				local instanceState = nil
				local secondaryInstanceState = nil
				local number = 0
				local secondaryNumber = nil
				local instance = nil

				while number ~= 1 do
					if number == 0 then
						secondaryNumber = 0
						instance = nil
						number = 1
					end
				end

				while true do
					if secondaryNumber == 1 then
						local number = 0

						repeat
							if number == 0 then
								instance.Adornee = parent
								instance.FillTransparency = 0.6
								number = 1
							end

							if number == 1 then
								instance.OutlineTransparency = 0
								instance.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								number = 2
							end
						until number == 2

						secondaryNumber = 2
					end

					if secondaryNumber == 2 then
						break
					end

					if secondaryNumber == 0 then
						local number = 0

						repeat
							if number == 0 then
								if capturedInstance and capturedInstance.Parent then
									capturedInstance:Destroy()
								end

								if capturedByteCount then
									while 0 ~= 0 do
									end

									while 0 ~= 0 do
									end

									connection = capturedByteCount
									connection.Disconnect(connection)
									byteCount = nil
									capturedByteCount = byteCount
								end

								number = 1
							end

							if number == 1 then
								connection = "nz\"C\195_)\133"
								instance = Instance.new(integerToBytes("2K$\1713@\226\006\014", connection, nameState, secondaryNameState, alternateNameState, instanceState, secondaryInstanceState))
								byteCount = "\182\021\209;*"
								instance.Name = integerToBytes("W\180H^\243r\182~y\230J\153RM\222y\184\\B\194", byteCount, connection, nameState, secondaryNameState, alternateNameState)
								number = 2
							end
						until number == 2

						secondaryNumber = 1
					end
				end

				instance.Parent = parent
				capturedInstance = instance
				capturedParent = parent
				capturedByteCount = service.RenderStepped:Connect(function(dt)
					local fillColorState = nil
					local secondaryFillColorState = nil
					local number = 0
					local fillColor = nil

					repeat
						if number == 0 then
							if not updateInstancePropertiesFlag or not instance.Parent then
								while 0 ~= 0 do
								end

								while 0 ~= 0 do
								end

								if capturedByteCount then
									while 0 ~= 0 do
									end

									while 0 ~= 0 do
									end

									capturedByteCount:Disconnect()
									capturedByteCount = nil
								end

								return
							end

							updateInstancePropertiesNumber = (updateInstancePropertiesNumber + dt * 0.4) % 1
							number = 1
						end

						if number == 1 then
							fillColor = Color3.fromHSV(updateInstancePropertiesNumber, 1, 1, fillColorState, secondaryFillColorState)
							instance.OutlineColor = fillColor
							number = 2
						end
					until number == 2

					instance.FillColor = fillColor
				end, byteCount, connection, nameState)
			end
			local function handleFlag(flagNumber)
				local assetCategory = nil
				local okNumber = nil
				local integerToBytesFunction = nil
				local integerToBytesValue = nil
				local byteCount = nil
				local flagText = nil
				local textNumber = nil
				local secondaryIntegerToBytesFunction = nil
				local number = nil
				local flagState = nil
				local secondaryFlagState = nil
				local alternateFlagState = nil
				local additionalFlagState = nil
				local fallbackFlagState = nil
				local nestedFlagState = nil
				local innerFlagState = nil
				local outerFlagState = nil
				local previousFlagState = nil
				local currentFlagState = nil
				local nextFlagState = nil
				local sourceFlagState = nil
				local targetFlagState = nil
				local flagStateVariantA = nil
				local flagStateVariantB = nil
				local flagStateVariantC = nil
				local flagStateVariantD = nil
				local secondaryFlagNumber = 0
				local uid = nil
				local ipairsResultNumber = nil
				local alternateIntegerToBytesFunction = nil
				local additionalIntegerToBytesFunction = nil
				local optionNumber = nil
				local flag = nil

				repeat
					if secondaryFlagNumber == 1 then
						optionNumber = -1

						if secondaryGetNameFlag and eggCmdsModule and eggCmdsModule.GetAreaEggSnapshot then
							local secondaryFlagNumber = 0
							local alternateFlagNumber = nil

							repeat
								if secondaryFlagNumber == 0 then
									alternateFlagNumber = 0
									secondaryFlagNumber = 1
								end
							until secondaryFlagNumber == 1

							while alternateFlagNumber ~= 0 do
							end

							local ok, result, pcallResult, secondaryPcallResult, alternatePcallResult, additionalPcallResult, fallbackPcallResult

							ok, result, pcallResult, secondaryPcallResult, alternatePcallResult, additionalPcallResult, fallbackPcallResult, assetCategory, okNumber, integerToBytesFunction, integerToBytesValue = pcall(function()
								return eggCmdsModule.GetAreaEggSnapshot()
							end)

							if ok and result and type(result.Records) == integerToBytes("\163V\199\017$", "\222\2157\165}A", alternatePcallResult, additionalPcallResult, fallbackPcallResult, assetCategory, okNumber, integerToBytesFunction, integerToBytesValue, byteCount, flagText, textNumber, secondaryIntegerToBytesFunction) then
								local ipairsResult, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, innerIpairsResult

								ipairsResult, secondaryIpairsResult, alternateIpairsResult, additionalIpairsResult, fallbackIpairsResult, nestedIpairsResult, innerIpairsResult, assetCategory, okNumber, integerToBytesFunction, integerToBytesValue, byteCount = ipairs(result.Records)

								for _, item in ipairsResult, secondaryIpairsResult, alternateIpairsResult do
									local secondaryFlagNumber = 0
									local Uid = nil

									assetCategory = nil

									repeat
										if secondaryFlagNumber == 0 then
											okNumber = 0

											repeat
												if okNumber == 0 then
													Uid = item.Uid
													assetCategory = item.AssetCategory
													okNumber = 1
												end
											until okNumber == 1

											secondaryFlagNumber = 1
										end
									until secondaryFlagNumber == 1

									if Uid and assetCategory then
										okNumber = 0
										integerToBytesFunction = nil
										integerToBytesValue = nil

										while okNumber ~= 1 do
											if okNumber == 0 then
												integerToBytesFunction = 0
												integerToBytesValue = nil
												okNumber = 1
											end
										end

										byteCount = nil

										while integerToBytesFunction ~= 1 do
											if integerToBytesFunction == 0 then
												flagText = 0

												while flagText ~= 1 do
													if flagText == 0 then
														integerToBytesValue = getFlagName(assetCategory)
														secondaryIntegerToBytesFunction = integerToBytesValue
														textNumber = isFlagNumberValid(secondaryIntegerToBytesFunction)
														byteCount = textNumber
														flagText = 1
													end
												end

												integerToBytesFunction = 1
											end
										end

										if optionNumber < byteCount and flagNumber <= byteCount then
											flagText = 0

											while flagText ~= 0 do
											end

											textNumber = 0

											repeat
												if textNumber == 0 then
													optionNumber = byteCount
													uid = Uid
													textNumber = 1
												end
											until textNumber == 1

											number = assetCategory
											secondaryIntegerToBytesFunction = tostring(number)
											alternateIntegerToBytesFunction = secondaryIntegerToBytesFunction
											additionalIntegerToBytesFunction = integerToBytesValue
										end
									end
								end
							end
						end

						secondaryFlagNumber = 2
					end

					if secondaryFlagNumber == 0 then
						if not flagNumber then
							flagNumber = 0
						end

						additionalIntegerToBytesFunction = "—"
						alternateIntegerToBytesFunction = "—"
						ipairsResultNumber = nil
						uid = nil
						secondaryFlagNumber = 1
					end

					if secondaryFlagNumber == 2 then
						local alternateFlagNumber = 0

						while alternateFlagNumber ~= 1 do
							if alternateFlagNumber == 0 then
								if uid then
									ipairsResultNumber = handleResult(uid)
								end

								if not uid then
									local iterator, state, control, _, _, _, _, _, _ = ipairs(alternateService:GetChildren())

									for _, nameNumber in iterator, state, control do
										if nameNumber:IsA(integerToBytes("\001\222\194\031\254", "*L\177\166z\146\161\141", assetCategory, okNumber, integerToBytesFunction, integerToBytesValue, byteCount, flagText, textNumber, secondaryIntegerToBytesFunction, number, flagState, secondaryFlagState, alternateFlagState, additionalFlagState, fallbackFlagState)) then
											local secondaryFlagNumber = 0
											local alternateFlagNumber = nil
											local text = nil
											local assetCategoryNumber = nil

											repeat
												if secondaryFlagNumber == 1 then
													assetCategoryNumber = nil
													secondaryFlagNumber = 2
												end

												if secondaryFlagNumber == 0 then
													alternateFlagNumber = 0
													text = nil
													secondaryFlagNumber = 1
												end
											until secondaryFlagNumber == 2

											repeat
												if alternateFlagNumber == 0 then
													local flagNumber = 0

													repeat
														if flagNumber == 0 then
															local GetAttribute = nameNumber.GetAttribute

															integerToBytesValue = integerToBytes
															byteCount = "\132\153\022\203mU\164\158\000\201vd\188"
															flagText = "\022\197\234e\174\025"
															text = GetAttribute(nameNumber, integerToBytesValue(byteCount, flagText, textNumber, secondaryIntegerToBytesFunction, number, flagState, secondaryFlagState, alternateFlagState, additionalFlagState, fallbackFlagState, nestedFlagState, innerFlagState, outerFlagState, previousFlagState, currentFlagState, nextFlagState, sourceFlagState, targetFlagState, flagStateVariantA, flagStateVariantB, flagStateVariantC, flagStateVariantD)) or nameNumber.Name
															integerToBytesFunction = text
															assetCategoryNumber = getFlagName(integerToBytesFunction)
															flagNumber = 1
														end
													until flagNumber == 1

													alternateFlagNumber = 1
												end
											until alternateFlagNumber == 1

											okNumber = assetCategoryNumber
											assetCategory = isFlagNumberValid(okNumber)

											local additionalFlagNumber = assetCategory

											if optionNumber < additionalFlagNumber and flagNumber <= additionalFlagNumber then
												okNumber = nameNumber

												local FindFirstChild = nameNumber.FindFirstChild

												integerToBytesFunction = integerToBytes
												integerToBytesValue = "\b3\162"
												byteCount = "\230MTż\022Ϸ"

												repeat
													repeat
														if flag or (flag or FindFirstChild(okNumber, integerToBytesFunction(integerToBytesValue, byteCount, flagText, textNumber, secondaryIntegerToBytesFunction, number, flagState, secondaryFlagState, alternateFlagState, additionalFlagState, fallbackFlagState, nestedFlagState, innerFlagState, outerFlagState, previousFlagState, currentFlagState, nextFlagState, sourceFlagState, targetFlagState, flagStateVariantA, flagStateVariantB))) then
															flag = false
															assetCategory = 0

															while assetCategory ~= 2 do
																if assetCategory == 1 then
																	okNumber = 0

																	repeat
																		if okNumber == 0 then
																			ipairsResultNumber = nameNumber
																			integerToBytesValue = text
																			integerToBytesFunction = tostring(integerToBytesValue)
																			alternateIntegerToBytesFunction = integerToBytesFunction
																			okNumber = 1
																		end
																	until okNumber == 1

																	assetCategory = 2
																end

																if assetCategory == 0 then
																	okNumber = 0

																	repeat
																		if okNumber == 0 then
																			optionNumber = additionalFlagNumber
																			uid = nameNumber.Name
																			okNumber = 1
																		end
																	until okNumber == 1

																	assetCategory = 1
																end
															end

															additionalIntegerToBytesFunction = assetCategoryNumber
														else
															okNumber = nameNumber

															local findFirstChild = nameNumber.FindFirstChild

															integerToBytesFunction = integerToBytes
															integerToBytesValue = "\220\019\193څ\181\210:\236\026\194\239"
															byteCount = "U\153t\166\156\236\193\144"

															if findFirstChild(okNumber, integerToBytesFunction(integerToBytesValue, byteCount, flagText, textNumber, secondaryIntegerToBytesFunction, number, flagState, secondaryFlagState, alternateFlagState, additionalFlagState, fallbackFlagState, nestedFlagState, innerFlagState, outerFlagState, previousFlagState, currentFlagState, nextFlagState, sourceFlagState, targetFlagState, flagStateVariantA, flagStateVariantB)) then
																flag = true
															end

															if not flag then
																okNumber = nameNumber

																local FindFirstChildWhichIsA = nameNumber.FindFirstChildWhichIsA

																integerToBytesFunction = integerToBytes
																integerToBytesValue = "\137\229^\187\212\001\182\244"
																byteCount = "`Ā-ӄ"
																assetCategory = FindFirstChildWhichIsA(okNumber, integerToBytesFunction(integerToBytesValue, byteCount, flagText, textNumber, secondaryIntegerToBytesFunction, number, flagState, secondaryFlagState, alternateFlagState, additionalFlagState, fallbackFlagState, nestedFlagState, innerFlagState, outerFlagState, previousFlagState, currentFlagState, nextFlagState, sourceFlagState, targetFlagState, flagStateVariantA, flagStateVariantB))

																if assetCategory then
																	flag = true
																end
															end
														end
													until not flag
												until not flag
											end
										end
									end
								end

								alternateFlagNumber = 1
							end
						end

						secondaryFlagNumber = 3
					end
				until secondaryFlagNumber == 3

				return uid, ipairsResultNumber, alternateIntegerToBytesFunction
			end
			local function handler()
				local state = nil
				local secondaryState = nil
				local alternateState = nil
				local additionalState = nil
				local fallbackState = nil
				local nestedState = nil
				local innerState = nil
				local outerState = nil
				local previousState = nil
				local currentState = nil
				local nextState = nil
				local sourceState = nil
				local number = 0
				local stateFlag = nil
				local parent = nil

				repeat
					if number == 0 then
						if not updateInstancePropertiesFlag then
							while 0 ~= 0 do
							end

							local stateNumber = 0

							repeat
								if stateNumber == 0 then
									local number = 0

									repeat
										if number == 0 then
											handleState()
											capturedStateResult = nil
											number = 1
										end
									until number == 1

									stateNumber = 1
								end
							until stateNumber == 1

							return
						end

						local stateFlagResult, stateResult, result, secondaryStateFlagResult, alternateStateFlagResult

						stateFlag, parent, stateFlagResult, stateResult, result, secondaryStateFlagResult, alternateStateFlagResult = handleFlag(0)
						number = 1
					end

					if number == 1 then
						if stateFlag and not parent then
							local number = 0
							local difference = nil

							while true do
								if number == 0 then
									if stateFlag ~= capturedStateResult then
										while 0 ~= 0 do
										end

										while 0 ~= 0 do
										end

										capturedStateResult = stateFlag
										differenceNumber = os.clock()
									end

									difference = os.clock() - differenceNumber
									number = 1
								end

								if number == 2 then
									break
								end

								if number == 1 then
									if difference < stateNumber and capturedStateFlag and capturedInstance and capturedInstance.Parent then
										return
									end

									if difference >= stateNumber then
										handleState()
									end

									number = 2
								end
							end

							return
						end

						capturedStateResult = nil
						number = 2
					end
				until number == 2

				if not parent then
					handleState()
				else
					local stateNumber = 0
					local number = nil
					local flag = nil

					while stateNumber ~= 1 do
						if stateNumber == 0 then
							number = 0
							flag = nil
							stateNumber = 1
						end
					end

					repeat
						if number == 0 then
							flag = false

							if stateFlag == capturedStateFlag then
								if capturedInstance and capturedInstance.Parent then
									if not capturedParent or parent == capturedParent then
										if capturedParent and not capturedParent.Parent then
											flag = true
										end
									else
										flag = true
									end
								else
									flag = true
								end
							else
								flag = true
							end

							number = 1
						end
					until number == 1

					if not flag then
						local stateNumber = 0
						local number = nil

						while stateNumber ~= 1 do
							if stateNumber == 0 then
								number = 0
								stateNumber = 1
							end
						end

						while number ~= 0 do
						end

						local stateFlag = isUpdateInstancePropertiesFlagValid()

						if stateFlag and not stateFlag:FindFirstChild(integerToBytes("\023\136hK\247\168\179\253\006\189Dk\192\174\183\221'", "\184U\237\027?\178\207\212", state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState)) then
							updateState(parent)
						end
					else
						local stateNumber = 0

						while true do
							if stateNumber == 1 then
								updateState(parent)
								capturedStateFlag = stateFlag
								stateNumber = 2
							end

							if stateNumber == 2 then
								break
							end

							if stateNumber == 0 then
								local number = 0

								repeat
									if number == 0 then
										handleState()
										updateRenderSteppedConnection(parent)
										number = 1
									end
								until number == 1

								stateNumber = 1
							end
						end

						capturedParent = parent
					end
				end
			end
			local function secondaryHandler(flag)
				local number = 0
				local elapsed = nil

				while true do
					if number == 0 then
						local secondaryNumber = 0

						while secondaryNumber ~= 1 do
							if secondaryNumber == 0 then
								if not eggCmdsModule or not eggCmdsModule.RequestCarryAreaEgg then
									return
								end

								if flagData.SkipIfCarrying and isValid() then
									return
								end

								secondaryNumber = 1
							end
						end

						number = 1
					end

					if number == 1 then
						if secondaryFlag then
							return
						end

						elapsed = os.clock()
						number = 2
					end

					if number == 3 then
						secondaryFlag = true
						task.spawn(function()
							local number = 0
							local capturedRequestCarryAreaEgg = nil
							local capturedFlag = nil
							local ok = nil

							repeat
								if number == 0 then
									capturedFlag = nil
									capturedRequestCarryAreaEgg = nil

									local result, pcallResult, secondaryPcallResult, alternatePcallResult

									ok, result, pcallResult, secondaryPcallResult, alternatePcallResult = pcall(function()
										local RequestCarryAreaEgg = eggCmdsModule.RequestCarryAreaEgg
										local secondaryFlag = flag

										RequestCarryAreaEgg(secondaryFlag)
										capturedFlag = secondaryFlag
										capturedRequestCarryAreaEgg = RequestCarryAreaEgg
									end)
									number = 1
								end
							until number == 1

							secondaryFlag = false

							if ok then
								return
							end
						end)

						return
					end

					if number == 2 then
						if elapsed - capturedElapsed < flagData.AttemptCooldown then
							return
						end

						capturedElapsed = elapsed
						number = 3
					end
				end
			end
			local function alternateHandler()
				local number = 0
				local secondaryNumber = nil
				local result = nil
				local numberFlag = nil
				local secondaryInput = nil
				local alternateNumber = nil

				repeat
					if number == 0 then
						secondaryNumber = 0
						result = nil
						number = 1
					end

					if number == 1 then
						numberFlag = nil
						secondaryInput = nil
						number = 2
					end

					if number == 2 then
						alternateNumber = nil
						number = 3
					end
				until number == 3

				while true do
					if secondaryNumber == 1 then
						if flagData.SkipIfCarrying and isValid() then
							return
						end

						local flagResult, secondaryFlagResult, alternateFlagResult, additionalFlagResult, fallbackFlagResult

						result, numberFlag, flagResult, secondaryFlagResult, alternateFlagResult, additionalFlagResult, fallbackFlagResult = handleFlag(flagData.MinPriority)
						secondaryNumber = 2
					end

					if secondaryNumber == 4 then
						if (secondaryInput.Position - alternateNumber).Magnitude <= flagData.MaxStealDistance then
							secondaryHandler(result)
						end

						return
					end

					if secondaryNumber == 3 then
						local number = 0

						while number ~= 1 do
							if number == 0 then
								alternateNumber = getPosition(numberFlag)

								if not secondaryInput or not alternateNumber then
									return
								end

								number = 1
							end
						end

						secondaryNumber = 4
					end

					if secondaryNumber == 0 then
						local number = 0

						while number ~= 1 do
							if number == 0 then
								if not flag then
									return
								end

								if secondaryFlag then
									return
								end

								number = 1
							end
						end

						secondaryNumber = 1
					end

					if secondaryNumber == 2 then
						local number = 0

						while number ~= 1 do
							if number == 0 then
								if not result or not numberFlag then
									return
								end

								secondaryInput = isUpdateInstancePropertiesFlagValid()
								number = 1
							end
						end

						secondaryNumber = 3
					end
				end
			end

			secondaryGuiObject.MouseButton1Click:Connect(function()
				local textState = nil
				local secondaryTextState = nil
				local alternateTextState = nil
				local additionalTextState = nil

				while 0 ~= 0 do
				end

				updateInstancePropertiesFlag = not updateInstancePropertiesFlag

				if not updateInstancePropertiesFlag then
					local number = 0

					repeat
						if number == 1 then
							secondaryGuiObject.TextColor3 = colorData.Gray
							handleState()
							number = 2
						end

						if number == 0 then
							secondaryGuiObject.Text = integerToBytes("$\161\130", "$k\231\196", textState, secondaryTextState)
							secondaryGuiObject.BackgroundColor3 = colorData.DarkGray
							number = 1
						end
					until number == 2

					capturedStateResult = nil
				else
					while 0 ~= 0 do
					end

					local number = 0

					while number ~= 1 do
						if number == 0 then
							secondaryGuiObject.Text = integerToBytes("'w", "?h9i", secondaryTextState, alternateTextState, additionalTextState)
							secondaryGuiObject.BackgroundColor3 = colorData.White
							number = 1
						end
					end

					secondaryGuiObject.TextColor3 = colorData.Background
					handler()
				end
			end, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ)
			alternateGuiObject.MouseButton1Click:Connect(function()
				local textState = nil
				local secondaryTextState = nil
				local alternateTextState = nil
				local additionalTextState = nil
				local fallbackTextState = nil

				while 0 ~= 0 do
				end

				while 0 ~= 0 do
				end

				flag = not flag

				if not flag then
					while 0 ~= 0 do
					end

					local number = 0

					while number ~= 1 do
						if number == 0 then
							local secondaryNumber = 0

							while secondaryNumber ~= 1 do
								if secondaryNumber == 0 then
									alternateGuiObject.Text = integerToBytes("&\139\027", "\019i\205]", textState, secondaryTextState, alternateTextState, additionalTextState, fallbackTextState)
									alternateGuiObject.BackgroundColor3 = colorData.DarkGray
									secondaryNumber = 1
								end
							end

							number = 1
						end
					end

					alternateGuiObject.TextColor3 = colorData.Gray
					secondaryFlag = false
				else
					while 0 ~= 0 do
					end

					local number = 0

					while number ~= 1 do
						if number == 0 then
							local secondaryNumber = 0

							repeat
								if secondaryNumber == 0 then
									alternateGuiObject.Text = integerToBytes("r\155", "\231=\213\194", textState, secondaryTextState, alternateTextState, additionalTextState, fallbackTextState)
									alternateGuiObject.BackgroundColor3 = colorData.White
									secondaryNumber = 1
								end
							until secondaryNumber == 1

							number = 1
						end
					end

					alternateGuiObject.TextColor3 = colorData.Background
				end
			end, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ)
			task.spawn(function()
				while secondaryParent.Parent do
					local number = 0

					while number ~= 1 do
						if number == 0 then
							local secondaryNumber = 0

							repeat
								if secondaryNumber == 0 then
									if updateInstancePropertiesFlag then
										pcall(handler)
									end

									if flag then
										pcall(alternateHandler)
									end

									secondaryNumber = 1
								end
							until secondaryNumber == 1

							number = 1
						end
					end

					task.wait(flagData.ScanInterval)
				end
			end)

			if secondaryGetNameFlag and eggCmdsModule then
				local state

				do
					instanceNumber = 0
					resultNumber = nil
					state = nil

					repeat
						if instanceNumber == 0 then
							resultNumber = 0
							state = nil
							instanceNumber = 1
						end
					until instanceNumber == 1
				end

				repeat
					if resultNumber == 1 then
						instanceNumber = 0

						while instanceNumber ~= 1 do
							if instanceNumber == 0 then
								pcall(function()
									if eggCmdsModule.AreaEggSnapshotUpdated then
										local AreaEggSnapshotUpdated = eggCmdsModule.AreaEggSnapshotUpdated
										local Connect = AreaEggSnapshotUpdated.Connect

										Connect(AreaEggSnapshotUpdated)
									end
								end)

								function onFocusLost()
									if eggCmdsModule.AreaEggUpdated then
										local AreaEggUpdated = eggCmdsModule.AreaEggUpdated
										local Connect = AreaEggUpdated.Connect

										Connect(AreaEggUpdated)
									end
								end

								pcall(onFocusLost)
								instanceNumber = 1
							end
						end

						resultNumber = 2
					end

					if resultNumber == 0 then
						state = nil

						function state()
							if updateInstancePropertiesFlag then
								task.defer(function()
									pcall(handler)
								end)
							end
						end

						resultNumber = 1
					end
				until resultNumber == 2

				pcall(function()
					if eggCmdsModule.AreaEggRemoved then
						local AreaEggRemoved = eggCmdsModule.AreaEggRemoved
						local Connect = AreaEggRemoved.Connect

						Connect(AreaEggRemoved)
					end
				end)
				pcallFunction = pcall

				function onChildAdded()
					if eggCmdsModule.AreaEggRareSpawnsPresented then
						local AreaEggRareSpawnsPresented = eggCmdsModule.AreaEggRareSpawnsPresented
						local Connect = AreaEggRareSpawnsPresented.Connect

						Connect(AreaEggRareSpawnsPresented)
					end
				end

				pcallFunction(onChildAdded)
			end

			alternateService.ChildAdded:Connect(function(child)
				local state = nil
				local secondaryState = nil
				local alternateState = nil
				local additionalState = nil

				while 0 ~= 0 do
				end

				while 0 ~= 0 do
				end

				if updateInstancePropertiesFlag then
					if child:IsA(integerToBytes("\132\aڄ3", "_\201h\190\225", state, secondaryState, alternateState, additionalState)) and (capturedStateResult == child.Name or capturedStateFlag == child.Name) then
						task.defer(function()
							pcall(handler)
						end)
					end

					return
				end
			end, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ)
			LocalPlayer.CharacterAdded:Connect(function()
				while 0 ~= 0 do
				end

				local number = 0

				while number ~= 1 do
					if number == 0 then
						local secondaryNumber = 0

						while secondaryNumber ~= 1 do
							if secondaryNumber == 0 then
								task.wait(1)

								if updateHeartbeatConnectionFlag then
									updateHeartbeatConnection()
								end

								secondaryNumber = 1
							end
						end

						number = 1
					end
				end

				if updateInstancePropertiesFlag then
					if not capturedParent or not capturedParent.Parent then
						handler()
					else
						updateState(capturedParent)
					end
				end
			end, pcallFunction, onChildAdded, onFocusLost, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ)

			local alternateFlag = false
			local inputPosition = nil
			local Position = nil

			size.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local number = 0

					repeat
						if number == 0 then
							local secondaryNumber = 0

							repeat
								if secondaryNumber == 0 then
									alternateFlag = true
									inputPosition = input.Position
									secondaryNumber = 1
								end
							until secondaryNumber == 1

							number = 1
						end
					until number == 1

					Position = alternateParent.Position
				end
			end, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ, stateVariantR, stateVariantS, stateVariantT, stateVariantU, stateVariantV, stateVariantW)
			size.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					alternateFlag = false
				end
			end, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ, stateVariantR, stateVariantS, stateVariantT, stateVariantU, stateVariantV, stateVariantW)
			additionalService.InputChanged:Connect(function(input)
				local positionState = nil
				local secondaryPositionState = nil
				local alternatePositionState = nil

				if alternateFlag then
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local number = 0
						local secondaryNumber = nil

						repeat
							if number == 0 then
								secondaryNumber = 0
								number = 1
							end
						until number == 1

						while secondaryNumber ~= 0 do
						end

						local difference = input.Position - inputPosition
						local parent = alternateParent
						local new = UDim2.new
						local XScale = Position.X.Scale
						local sum = Position.X.Offset + difference.X
						local YScale = Position.Y.Scale
						local YOffset = Position.Y.Offset
						local Y = difference.Y

						parent.Position = new(XScale, sum, YScale, YOffset + Y, Y, positionState, secondaryPositionState, alternatePositionState)
					end

					return
				end
			end, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ, stateVariantR, stateVariantS, stateVariantT, stateVariantU, stateVariantV, stateVariantW)
			secondaryParent.Destroying:Connect(onDestroying, colorResult, textResult, sizeResult, secondaryByteCount, nestedIpairsResult, fallbackIpairsResult, additionalIpairsResult, alternateIpairsResult, secondaryIpairsResult, result, destroy, nameNumber, ipairsResult, sizeNumber, parentNumber, colorNumber, textNumber, byteCount, parent, outerSizeResult, previousSizeResult, currentSizeResult, nextSizeResult, sourceSizeResult, targetSizeResult, alternateSizeState, additionalSizeState, fallbackSizeState, nestedSizeState, innerSizeState, outerSizeState, previousSizeState, currentSizeState, nextSizeState, sourceSizeState, targetSizeState, sizeStateVariantA, sizeStateVariantB, sizeStateVariantC, sizeStateVariantD, sizeStateVariantE, sizeStateVariantF, state, secondaryState, alternateState, additionalState, fallbackState, nestedState, innerState, outerState, previousState, currentState, nextState, sourceState, targetState, stateVariantA, stateVariantB, stateVariantC, stateVariantD, stateVariantE, stateVariantF, stateVariantG, stateVariantH, stateVariantI, stateVariantJ, stateVariantK, stateVariantL, stateVariantM, stateVariantN, stateVariantO, stateVariantP, stateVariantQ, stateVariantR, stateVariantS, stateVariantT, stateVariantU, stateVariantV, stateVariantW)
		end
	end

	local tonumberFunction = capturedTonumber
	local matchFunction = match
	local secondaryMatchFunction = match
	local target = {}
	local fallbackState = nil

	writeVariadicValues(target, 1, pcallFunction(updateMouseEnterConnection, fallbackState, state, secondaryState, alternateState, additionalState))

	local text = ":%d+:"

	if tonumberFunction(matchFunction(secondaryMatchFunction(target[2], text, updateMouseEnterConnection, fallbackState), "%d+", text)) ~= 1 then
		return updatePositionFromInput()
	end

	return updateMouseEnterConnection({})
end

return updatePositionFromInput()
