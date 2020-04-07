Scriptname Jiffy:Utility:FormList:ChronicleBehavior extends Chronicle:Package:CustomBehavior

FormList[] Property Lists Auto Const
FormList Property ListOfLists Auto Const

Function processLists()
	if (!Lists || !Lists.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < Lists.Length)
		Jiffy:Utility:FormList.clean(Lists[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function processListOfLists()
	if (!ListOfLists || !ListOfLists.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = ListOfLists.GetSize()
	while (iCounter < iSize)
		Jiffy:Utility:FormList.clean(ListOfLists.GetAt(iCounter) as FormList)
		iCounter += 1
	endWhile
EndFunction

Bool Function postloadBehavior()
	processLists()
	processListOfLists()
	return true
EndFunction
