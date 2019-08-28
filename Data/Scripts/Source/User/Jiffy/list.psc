Scriptname Jiffy:List extends Quest

CustomEvent Added
CustomEvent Removed
CustomEvent Cleaned
CustomEvent Cleared

Var[] data = None

Var[] Function getEventArguments(Var avItem)
	Var[] result = new Var[0]
	result.Add(avItem)
	return result
EndFunction

Function sendAdded(Var avItem)
	SendCustomEvent("Added", getEventArguments(avItem))
EndFunction

Function sendRemoved(Var avItem)
	SendCustomEvent("Removed", getEventArguments(avItem))
EndFunction

Function sendCleaned()
	SendCustomEvent("Cleaned")
EndFunction

Function sendCleared()
	SendCustomEvent("Cleared")
EndFunction

Function dataPrep()
	if (!data)
		data = new Var[0]
	endif
EndFunction

Bool Function hasData()
	return (data && data.Length)
EndFunction

Int Function getSize()
	if (!hasData())
		return 0
	endif
	
	return data.Length
EndFunction

Var Function get(Int iIndex)
	if (!hasData() || iIndex < 0 || iIndex >= data.Length)
		return None
	endif
	
	return data[iIndex]
EndFunction

Var[] Function getData()
	return data
EndFunction

Bool Function has(Var avItem)
	if (!hasData() || !avItem)
		return false
	endif
	
	Int iIndex = data.Find(avItem)
	return (0 <= iIndex)
EndFunction

Bool Function setData(Var[] newData)
	data = newData
EndFunction

Bool Function validate(Var avItem)
	return avItem as Bool
EndFunction

Var Function getAt(Int aiIndex)
	if (!hasData())
		return None
	endif
	
	return getData()[aiIndex]
EndFunction

Bool Function clean()
	if (!data || !data.Length)
		return false
	endif
	
	Bool bResult = false
	
	Int iCounter = 0
	Var current = None
	while (iCounter < data.Length)
		if (validate(data[iCounter]))
			iCounter += 1
		else
			data.Remove(iCounter)
			bResult = true
		endif
	endWhile
	
	if (bResult)
		sendCleaned()
	endif
	
	return bResult
EndFunction

Function clear()
	setData(None)
	sendCleared()
EndFunction

Function add(Var avItem)
	if (!validate(avItem) || has(avItem))
		return
	endif
	
	dataPrep()
	
	data.Add(avItem)
	sendAdded(avItem)
EndFunction

Function remove(Var avItem)
	if (!has(avItem))
		return
	endif
	
	Int iIndex = data.Find(avItem)
	if (0 <= iIndex)
		data.Remove(iIndex)
		sendRemoved(avItem)
	endif
EndFunction

Var[] Function populateBehavior()
	return None
EndFunction

Function populate()
	setData(populateBehavior())
EndFunction
