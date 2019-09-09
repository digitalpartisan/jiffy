Scriptname Jiffy:List extends Quest Hidden
{A generic sort of list processor.  This list type will not permit identical items (as determined by the logic in the equalityCheck() function) to exist in the list at the same time.

This code is technically thread-safe since FO4's threading logic means that only one script can call something like add() or remove() at a time.
There are no states on this script since this type of logic works well as a secondary attachment in the editor on an object using another script.
For the same reason, there is no observation of OnQuestInit() and OnQuestShutdown() events.  Even so, the data variable will be reset when any quest this script is attached to starts.

This script cannot serve as a list on its own since the Papyrus engine cannot compare the Var type and the ability to determine whether or not a particular item is already in the list depends on childred of this script type.
At the very least, a child script must implement the equalityCheck() method in order to be viable for use.
It is also avisable to implement getters, setters, and anything that might need to take input or give output using the type of data your list will contain to avoid needing to do that conversion everywhere your list might be used.}

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
	Jiffy:Logger:List.logAdded(self, avItem)
	SendCustomEvent("Added", getEventArguments(avItem))
EndFunction

Function sendRemoved(Var avItem)
	Jiffy:Logger:List.logRemoved(self, avItem)
	SendCustomEvent("Removed", getEventArguments(avItem))
EndFunction

Function sendCleaned()
	Jiffy:Logger:List.logCleaned(self)
	SendCustomEvent("Cleaned")
EndFunction

Function sendCleared()
	Jiffy:Logger:List.logCleared(self)
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

Bool Function rangeCheck(Int iIndex)
	return (0 <= iIndex && iIndex < getSize())
EndFunction

Var Function get(Int iIndex)
	if (rangeCheck(iIndex))
		return data[iIndex]
	endif
	
	return None
EndFunction

Var[] Function getData()
	return data
EndFunction

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
{Var variables cannot be compared.  Override this with your preferred data type comparisons to implement a non-abstract script type.}
	return false
EndFunction

Int Function find(Var avItem)
	if (!hasData() || !avItem)
		return -1
	endif
	
	Var[] dataSet = getData()
	Int iCounter = 0
	while (iCounter < dataSet.Length)
		if (equalityCheck(avItem, dataSet[iCounter]))
			return iCounter
		endif
		
		iCounter += 1
	endWhile
	
	return -1
EndFunction

Bool Function has(Var avItem)
	if (!hasData() || !avItem)
		return false
	endif
	
	Int iIndex = find(avItem)
	return (0 <= iIndex)
EndFunction

Bool Function setData(Var[] newData)
	data = newData
EndFunction

Bool Function validate(Var avItem)
	return avItem as Bool
EndFunction

Bool Function validateData()
	if (!hasData())
		true ; because there is nothing invalid about any of the data
	endif
	
	Int iCounter = 0
	while (iCounter < getSize())
		if (!validate(get(iCounter)))
			return false
		endif
		
		iCounter += 1
	endWhile
	
	return true
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
			removeAt(iCounter)
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

Bool Function add(Var avItem)
	if (!validate(avItem) || has(avItem))
		return false
	endif
	
	dataPrep()
	
	data.Add(avItem)
	sendAdded(avItem)
	
	return true
EndFunction

Bool Function remove(Var avItem)
	Int iIndex = find(avItem)
	
	if (0 <= iIndex)
		return removeAt(iIndex)
	endif
	
	return false
EndFunction

Bool Function removeAt(Int iIndex)
	if (!rangeCheck(iIndex))
		return false
	endif
	
	Var item = get(iIndex)
	getData().Remove(iIndex)
	sendRemoved(item)
	
	return true
EndFunction

Var[] Function populateBehavior()
	return None
EndFunction

Function populate()
	setData(populateBehavior())
EndFunction
