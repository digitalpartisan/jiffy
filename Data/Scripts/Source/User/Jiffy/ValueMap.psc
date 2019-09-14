Scriptname Jiffy:ValueMap extends Quest

CustomEvent Added
CustomEvent Removed
CustomEvent Cleaned
CustomEvent Cleared

Struct TokenValue
	String token
	ScriptObject value ; beause a var isn't allowed here, dangit
EndStruct

TokenValue[] data = None

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

Function sendCleaned()
	SendCustomEvent("Cleaned")
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

Function clearData()
	setData(None)
	sendCleared()
EndFunction

Bool Function validate(TokenValue tvMapping) Global
	return (tvMapping && tvMapping.token && "" != tvMapping.token && tvMapping.value)
EndFunction

Int Function findToken(String asToken)
	if (!hasData() || "" == asToken)
		return -1
	endif
	
	return data.FindStruct("token", asToken)
EndFunction

Int Function findTokenValue(TokenValue tvMapping)
	if (!tvMapping)
		return -1
	endif
	
	
EndFunction
