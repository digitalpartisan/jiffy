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
		theArray.Add(theList.getAt(iCounter))
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

Function addForms(FormList targetList, Form[] forms) Global
	if (!targetList || !forms || !forms.Length)
		return
	endif
	
	Int iCounter = 0
	while(iCounter < forms.Length)
		targetList.AddForm(forms[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function removeForms(FormList targetList, Form[] forms) Global
	if (!targetList || !forms || !forms.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < forms.Length)
		targetList.RemoveAddedForm(forms[iCounter])
		iCounter += 1
	endWhile
EndFunction

Form[] Function getCleanForms(FormList targetList) Global
	if (!targetList || !targetList.GetSize())
		return None
	endif
	
	Int iCounter = 0
	Int iSize = targetList.GetSize()
	Form[] forms = new Form[0]
	Form current = None
	while (iCounter < iSize)
		current = targetList.GetAt(iCounter)
		current && forms.Add(current)
		iCounter += 1
	endWhile
	
	return forms
EndFunction

FormList[] Function adjustFormListContents(FormList targetList, Form[] correctForms) Global
	if (!targetList || !correctForms || correctForms.Length >= targetList.GetSize())
		return None
	endif
	
	Int iPreRevertSize = targetList.GetSize()
	targetList.Revert()
	if (iPreRevertSize == targetList.GetSize())
		return None
	endif
	
	FormList[] formLists = new FormList[0]
	Int iCounter = 0
	while (iCounter < correctForms.Length)
		!targetList.HasForm(correctForms[iCounter]) && targetList.AddForm(correctForms[iCounter])
		(correctForms[iCounter] is FormList) && formLists.Add(correctForms[iCounter] as FormList)
		iCounter += 1
	endWhile
	
	return formLists
EndFunction

Function clean(FormList aflList, Bool bRecursive = true) Global
	if (!aflList || !aflList.GetSize())
		Jiffy:Logger.log("FormList " + aflList + " does not need cleaning")
		return
	endif
	
	Jiffy:Logger.cleaning(aflList)
	
	Form[] cleanForms = getCleanForms(aflList)
	FormList[] children = adjustFormListContents(aflList, cleanForms)
	bRecursive && cleanBulk(children)
	
	Jiffy:Logger.doneCleaning(aflList)
EndFunction

Function cleanBulk(FormList[] formLists, Bool bRecursive = true) Global
	if (!formLists || !formLists.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < formLists.Length)
		clean(formLists[iCounter], bRecursive)
		iCounter += 1
	endWhile
EndFunction