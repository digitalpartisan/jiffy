Scriptname Jiffy:Settlement:Picker:Handler extends Quest

ReferenceAlias Property PickerAlias Auto Const Mandatory

Jiffy:Settlement:Picker Function getPicker()
	return PickerAlias.GetActorReference() as Jiffy:Settlement:Picker
EndFunction

Function handleExclusion(WorkshopScript workshopRef = None, Bool bApply = true)
	if (!workshopRef)
		return
	endif

	FormList excludedKeywords = getPicker().ExcludedKeywords
	if (!excludedKeywords || 0 == excludedKeywords.getSize()) ; if there is no defined list or the list is empty, don't both
		return
	endif
	
	Int iCounter = 0
	Int iSize = excludedKeywords.GetSize()
	Keyword currentKeyword = None
	while (iCounter < iSize)
		currentKeyword = excludedKeywords.GetAt(iCounter) as Keyword
		if (currentKeyword) ; Just in case a "none" record made it in to the list
			if (bApply)
				workshopRef.AddKeyword(currentKeyword)
			else
				workshopRef.RemoveKeyword(currentKeyword)
			endif
		endif
		
		iCounter += 1
	endWhile
EndFunction

WorkshopScript Function pick(WorkshopScript excludeWorkshopRef = None)
	handleExclusion(excludeWorkshopRef)
	WorkshopScript chosenWorkshop = getPicker().pick()
	handleExclusion(excludeWorkshopRef, false)
	
	return chosenWorkshop
EndFunction

WorkshopScript Function pickWithDefault(Location defaultLocation, WorkshopScript excludeWorkshopRef = None)
	handleExclusion(excludeWorkshopRef)
	WorkshopScript chosenWorkshop = getPicker().pick(defaultLocation)
	handleExclusion(excludeWorkshopRef, false)
	
	return chosenWorkshop
EndFunction
