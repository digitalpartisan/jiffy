Scriptname Jiffy:ValueMap extends Quest

CustomEvent Added
CustomEvent Removed
CustomEvent Cleared

Struct TokenValue
	String token
	ScriptObject value ; beause a var isn't allowed here, dangit
EndStruct

String sStateWaiting = "Waiting" Const
String sStateStarted = "Started" Const

TokenValue[] data = None

Function goToWaiting()
	GoToState(sStateWaiting)
EndFunction

Function goToStarted()
	GoToState(sStateStarted)
EndFunction

Bool Function validate(TokenValue tvMapping) Global
	return (tvMapping && tvMapping.token && "" != tvMapping.token && tvMapping.value)
EndFunction

Bool Function compare(TokenValue tvOne, TokenValue tvTwo) Global
	if (!validate(tvOne) || !validate(tvTwo))
		return false
	endif
	
	return (tvOne.token == tvTwo.token && tvOne.value == tvTwo.value)
EndFunction

TokenValue Function create(String asToken, ScriptObject asoValue) Global
	TokenValue result = new TokenValue
	result.token = asToken
	result.value = asoValue
	
	if (!validate(result))
		return None
	endif
	
	return result
EndFunction

Var[] Function getEventArguments(TokenValue newMapping)
	Var[] result = new Var[0]
	result.Add(newMapping)
	return result
EndFunction

Function sendAdded(TokenValue atvMapping)
	SendCustomEvent("Added", getEventArguments(atvMapping))
EndFunction

Function sendRemoved(TokenValue atvMapping)
	SendCustomEvent("Removed", getEventArguments(atvMapping))
EndFunction

Function sendCleared()
	SendCustomEvent("Cleared")
EndFunction

Function dataPrep()
	if (!data)
		data = new TokenValue[0]
	endif
EndFunction

TokenValue[] Function getData()
	return data
EndFunction

Bool Function hasData()
	return (data && data.Length)
EndFunction

Function setData(TokenValue[] newData)
	data = newData
EndFunction

Function clear()
	setData(None)
	sendCleared()
EndFunction

Int Function findToken(String asToken)
	if (!hasData() || "" == asToken)
		return -1
	endif
	
	return data.FindStruct("token", asToken)
EndFunction

Bool Function has(String asToken)
	return 0 <= findToken(asToken)
EndFunction	

Int Function findTokenValue(TokenValue tvMapping)
	if (!tvMapping)
		return -1
	endif
	
	return findToken(tvMapping.token)
EndFunction

Bool Function hasTokenValue(TokenValue tvMapping)
	return 0 <= findTokenValue(tvMapping)
EndFunction

ScriptObject Function get(String asToken)
	Int iIndex = findToken(asToken)
	if (0 > iIndex)
		return None
	endif
	
	return getData()[iIndex].value
EndFunction

Bool Function set(String asToken, ScriptObject asoValue)
	TokenValue newEntry = create(asToken, asoValue)
	if (!validate(newEntry))
		return false
	endif
	
	dataPrep()
	
	Int iIndex = findTokenValue(newEntry)
	if (0 > iIndex)
		(getData()).Add(newEntry)
	else
		getData()[iIndex] = newEntry
	endif
	
	sendAdded(newEntry)
	return true
EndFunction

Bool Function unset(String asToken)
	Int iIndex = findToken(asToken)
	if (0 > iIndex)
		return false
	endif
	
	TokenValue[] dataSet = getData()
	TokenValue removeMe = dataSet[iIndex]
	dataSet.Remove(iIndex)
	
	sendRemoved(removeMe)
	return true
EndFunction

Function initialize()
{So that anything using the generic form of this script can initialize the map values without knowing anything about the domain the ValueMap operates in.}
EndFunction

Auto State Waiting
	Event OnBeginState(String asOldState)
		clear()
	EndEvent
	
	Event OnQuestInit()
		goToStarted()
	EndEvent
	
	Function goToWaiting()
	
	EndFunction
	
	Function initialize()
	
	EndFunction
EndState

State Started
	Event OnBeginState(String asOldState)
		initialize()
	EndEvent
	
	Event OnQuestShutdown()
		goToWaiting()
	EndEvent
	
	Function goToStarted()
	
	EndFunction
EndState

Function startBulk(Jiffy:ValueMap[] maps) Global
	if (!maps || !maps.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < maps.Length)
		if (maps[iCounter])
			maps[iCounter].Start()
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function stopBulk(Jiffy:ValueMap[] maps) Global
	if (!maps || !maps.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < maps.Length)
		if (maps[iCounter])
			maps[iCounter].Stop()
		endif
		
		iCounter += 1
	endWhile
EndFunction
