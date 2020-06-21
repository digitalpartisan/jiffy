Scriptname Jiffy:Utility:FormList Hidden Const

Form[] Function toArray(FormList theList) Global
{Converts the specified FormList to a Form[]}
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
{Selects a random Form from the specified FormList}
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
{Adds the forms in a Form[] to the specified FormList}	
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
{Removes the forms in a Form[] from the specified FormList}
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
{Returns a Form[] containing all the non-None forms from the specified FormList}
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
{Using the contents of the Form[] as a known-good list, ensures that the FormList specified contains no "None" forms and returns any FormList items that may need further cleaning.}
	if (!targetList || !correctForms)
		return None
	endif
	
	targetList.Revert()
	
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
{Given a FormList, ensures that it contains no "None" forms and optionally performs the same process to any FormList children if the recursive flag is true.}
	if (!aflList || !aflList.GetSize())
		Jiffy:Utility:Logger.log("FormList " + aflList + " does not need cleaning")
		return
	endif
	
	Jiffy:Utility:Logger.cleaning(aflList)
	
	Form[] cleanForms = getCleanForms(aflList)
	FormList[] children = adjustFormListContents(aflList, cleanForms)
	bRecursive && cleanBulk(children)
	
	Jiffy:Utility:Logger.doneCleaning(aflList)
EndFunction

Function cleanBulk(FormList[] formLists, Bool bRecursive = true) Global
{Cleans each FormList indicated, optionally recursing over each FormList found.}
	if (!formLists || !formLists.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < formLists.Length)
		clean(formLists[iCounter], bRecursive)
		iCounter += 1
	endWhile
EndFunction
