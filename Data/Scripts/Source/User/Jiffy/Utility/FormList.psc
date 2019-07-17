Scriptname Jiffy:Utility:FormList Hidden Const

Form[] Function toArray(FormList theList) Global
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

Form Function random(FormList theList) Global
	if (!theList)
		return None
	endif
	
	Int iSize = theList.GetSize()
	if (!iSize)
		return None
	endif
	
	return theList.GetAt(Utility.RandomInt(0, iSize - 1))
EndFunction
