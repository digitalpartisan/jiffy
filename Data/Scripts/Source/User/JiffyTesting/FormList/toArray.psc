Scriptname JiffyTesting:FormList:ToArray extends ObjectReference

FormList Property JiffyTesting_Utility_FormList Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Converting")
	EndEvent
EndState

State Converting
	Event OnBeginState(String asOldState)
		Jiffy:Logger.log("Converted FormList " + JiffyTesting_Utility_FormList + " to array " + Jiffy:Utility:FormList.toArray(JiffyTesting_Utility_FormList))
		GoToState("Waiting")
	EndEvent
EndState
