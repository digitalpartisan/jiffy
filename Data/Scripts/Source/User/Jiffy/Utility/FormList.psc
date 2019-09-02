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

Function clean(FormList aflList, Bool bRecursive = true) Global
	if (!aflList || !aflList.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = aflList.GetSize()
	Form[] allForms = new Form[0]
	Form current = None
	while (iCounter < iSize)
		current = aflList.GetAt(iCounter)
		if (current)
			if (current is FormList && bRecursive)
				clean(current as FormList)
			endif
			
			allForms.Add(current)
			iCounter += 1
		endif
	endWhile
	
	aflList.Revert()
	iCounter = 0
	while (iCounter < allForms.Length)
		current = allForms[iCounter]
		if (!aflList.HasForm(current))
			aflList.AddForm(current)
		endif
		
		iCounter += 1
	endWhile
EndFunction
