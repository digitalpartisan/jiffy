Scriptname JiffyTesting:QueuePoller extends ObjectReference

Jiffy:List:Queue:Form Property Queue Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Polling")
	EndEvent
EndState

State Polling
	Event OnBeginState(String asOldState)
		Game.GetPlayer().AddItem(Queue.pollForm())
		GoToState("Waiting")
	EndEvent
EndState
