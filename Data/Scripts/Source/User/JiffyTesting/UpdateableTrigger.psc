Scriptname JiffyTesting:UpdateableTrigger extends ObjectReference

JiffyTesting:UpdateableList Property TheList Auto Const Mandatory
Form Property ToAdd Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Adding")
	EndEvent
EndState

State Adding
	Event OnBeginState(String asOldState)
		TheList.addTrueData(ToAdd)
		GoToState("Waiting")
	EndEvent
EndState
