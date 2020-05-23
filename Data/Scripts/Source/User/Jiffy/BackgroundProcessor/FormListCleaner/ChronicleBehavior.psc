Scriptname Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior extends chronicle:package:custombehavior

Jiffy:BackgroundProcessor:FormListCleaner Property MyCleaner Auto Const Mandatory
FormList[] Property Lists Auto Const
FormList Property ListOfLists Auto Const

Jiffy:BackgroundProcessor:FormListCleaner Function getCleaner()
	return MyCleaner
EndFunction

FormList[] Function getLists()
	return Lists
EndFunction

FormList Function getListOfLists()
	return ListOfLists
EndFunction

Function processLists()
	FormList[] listSet = getLists()
	if (!listSet || !listSet.Length)
		return
	endif
	
	Int iCounter = 0
	Jiffy:BackgroundProcessor:FormListCleaner cleaner = getCleaner()
	while (iCounter < listSet.Length)
		cleaner.clean(listSet[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function processListOfLists()
	FormList myLists = getListOfLists()
	if (!myLists || !myLists.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = myLists.GetSize()
	Jiffy:BackgroundProcessor:FormListCleaner cleaner = getCleaner()
	while (iCounter < iSize)
		cleaner.clean(myLists.GetAt(iCounter) as FormList)
		iCounter += 1
	endWhile
EndFunction

Bool Function installBehavior()
	getCleaner().Start()
EndFunction

Bool Function postloadBehavior()
	processLists()
	processListOfLists()
	return true
EndFunction

Bool Function uninstallBehavior()
	getCleaner().Stop()
EndFunction
