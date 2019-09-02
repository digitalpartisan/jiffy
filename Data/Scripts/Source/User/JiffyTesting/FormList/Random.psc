Scriptname JiffyTesting:FormList:Random extends ObjectReference

FormList Property JiffyTesting_Utility_FormList Auto Const Mandatory

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
		Game.GetPlayer().AddItem(Jiffy:Utility:FormList.random(JiffyTesting_Utility_FormList))
		GoToState("Waiting")
	EndEvent
EndState
