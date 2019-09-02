Scriptname JiffyTesting:QueueTrigger extends ObjectReference

Jiffy:List:Queue Property Queue Auto Const Mandatory
Form Property AddThis Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Adding")
	EndEvent
EndState

State Adding
	Event OnBeginState(String asOldState)
		BlockActivation(true, true)
		Queue.add(AddThis)
		GoToState("Waiting")
	EndEvent
EndState
