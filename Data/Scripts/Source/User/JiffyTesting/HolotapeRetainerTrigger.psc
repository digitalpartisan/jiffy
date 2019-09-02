Scriptname JiffyTesting:HolotapeRetainerTrigger extends ObjectReference

Jiffy:HolotapeRetainer Property RetainerQuest Auto Const Mandatory

Message Property JiffyTesting_HolotapeRetainer_StartText Auto Const Mandatory
Message Property JiffyTesting_HolotapeRetainer_StopText Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		RetainerQuest.Stop()
		SetActivateTextOverride(JiffyTesting_HolotapeRetainer_StartText)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Running")
	EndEvent
EndState

State Running
	Event OnBeginState(String asOldState)
		RetainerQuest.Start()
		SetActivateTextOverride(JiffyTesting_HolotapeRetainer_StopText)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Waiting")
	EndEvent
EndState
