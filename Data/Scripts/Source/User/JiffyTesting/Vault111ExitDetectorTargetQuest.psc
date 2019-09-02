Scriptname JiffyTesting:Vault111ExitDetectorTargetQuest extends Quest

Message Property JiffyTesting_Vault111ExitDetector_TargetQuest_Message Auto Const Mandatory

Event OnQuestInit()
	JiffyTesting_Vault111ExitDetector_TargetQuest_Message.Show()
	Stop()
EndEvent
