Scriptname JiffyTesting:Array:Random extends ObjectReference

JiffyTesting:FormArray Property Forms Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Giving")
	EndEvent
EndState

State Giving
	Event OnBeginState(String asOldState)
		Game.GetPlayer().AddItem(Jiffy:Utility:Array.random(Forms.MyForms as Var[]) as Form)
		GoToState("Waiting")
	EndEvent
EndState
