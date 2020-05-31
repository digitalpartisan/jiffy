Scriptname JiffyTesting:FormListCleaning extends Quest

String Property RemotePluginName = "JiffyTestingRemote.esp" Auto Const

FormList Property JiffyTestingFormListNone Auto Const Mandatory
FormList Property JiffyTestingFormlistNoneWeapons Auto Const Mandatory
FormList Property JiffyTestingFormListNoneAmmo Auto Const Mandatory
FormList Property JiffyTestingFormListNonePotions Auto Const Mandatory

Armor[] Property ArmorsToAdd Auto Const Mandatory

Jiffy:BackgroundProcessor:FormListCleaner Property JiffyTestingFormListCleaner Auto Const Mandatory

Int Property RemoteFormListID = 0x0000173F Auto Const

Int Property Remote10mmID = 0x001732 Auto Const
Int Property Remote44ID = 0x00001733 Auto Const
Int Property RemoteAlienBlasterID = 0x00001734 Auto Const

Int Property RemoteAddictolID = 0x00001735 Auto Const
Int Property RemoteBeerBottleID = 0x00001737 Auto Const
Int Property RemoteBeerGwinnettID = 0x00001739 Auto Const

Int Property RemoteAmmo10mmID = 0x0000173C Auto Const
Int Property RemoteAmmo2mmECID = 0x0000173D Auto Const
Int Property RemoteAmmo308ID = 0x0000173E Auto Const

Form Function loadForm(Int formID)
	return Game.GetFormFromFile(formID, RemotePluginName)
EndFunction

Function addToList(FormList targetList, Int formID)
	targetList.AddForm(loadForm(formID))
EndFunction

Function outputList()
	Jiffy:Utility:Logger.logFormList(JiffyTestingFormListNone)
EndFunction

Function performInjections()
	addToList(JiffyTestingFormListNone, RemoteFormListID)
	
	addToList(JiffyTestingFormlistNoneWeapons, Remote10mmID)
	addToList(JiffyTestingFormlistNoneWeapons, Remote44ID)
	addToList(JiffyTestingFormlistNoneWeapons, RemoteAlienBlasterID)
	
	addToList(JiffyTestingFormListNoneAmmo, RemoteAmmo10mmID)
	addToList(JiffyTestingFormListNoneAmmo, RemoteAmmo2mmECID)
	addToList(JiffyTestingFormListNoneAmmo, RemoteAmmo308ID)
	
	addToList(JiffyTestingFormListNonePotions, RemoteAddictolID)
	addToList(JiffyTestingFormListNonePotions, RemoteBeerBottleID)
	addToList(JiffyTestingFormListNonePotions, RemoteBeerGwinnettID)
	
	Int iCounter = 0
	while (iCounter < ArmorsToAdd.Length)
		JiffyTestingFormListNone.AddForm(ArmorsToAdd[iCounter])
		iCounter += 1
	endWhile
EndFunction

Function cleanList()
	Jiffy:Utility:FormList.clean(JiffyTestingFormListNone)
EndFunction

Function cleanWithProcessor()
	JiffyTestingFormListCleaner.clean(JiffyTestingFormListNone)
EndFunction
