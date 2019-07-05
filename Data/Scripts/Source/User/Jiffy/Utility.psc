Scriptname Jiffy:Utility Hidden

Form[] Function formListToArray(FormList theList) Global
	if (!theList)
		return None
	endif
	
	Int iSize = theList.GetSize()
	if (!iSize)
		return None
	endif
	
	Form[] theArray = new Form[0]
	
	Int iCounter = 0
	while (iCounter < iSize)
		theArray.Add(theList.getAt(iSize))
		iCounter += 1
	endWhile
	
	return theArray
EndFunction

Form Function random(Form[] theArray) Global
	if (!theArray || !theArray.Length)
		return None
	endif
	
	return theArray[Utility.RandomInt(0, theArray.Length - 1)]
EndFunction

Form Function randomFromList(FormList theList) Global
	if (!theList)
		return None
	endif
	
	Int iSize = theList.GetSize()
	if (!iSize)
		return None
	endif
	
	return theList.GetAt(Utility.RandomInt(0, iSize - 1))
EndFunction

ObjectReference Function randomReference(ObjectReference[] references) Global
	if (!references || !references.Length)
		return None
	endif
	
	return references[Utility.RandomInt(0, references.Length - 1)]
EndFunction
