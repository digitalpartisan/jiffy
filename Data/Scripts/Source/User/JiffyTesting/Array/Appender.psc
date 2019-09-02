Scriptname JiffyTesting:Array:Appender extends ObjectReference

JiffyTesting:FormArray Property JiffyTesting_Utility_Array_Set1 Auto Const Mandatory
JiffyTesting:FormArray Property JiffyTesting_Utility_Array_Set2 Auto Const Mandatory

Auto State Waiting
	Event OnBeginState(String asOldState)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Working")
	EndEvent
EndState

State Working
	Event OnBeginState(String asOldState)
		Form[] allForms = Jiffy:Utility:Array.append(JiffyTesting_Utility_Array_Set1.MyForms as Var[], JiffyTesting_Utility_Array_Set2.MyForms as Var[]) as Form[]
		Jiffy:Logger.log("Set 1: " + JiffyTesting_Utility_Array_Set1.MyForms + " Set 2: " + JiffyTesting_Utility_Array_Set2.MyForms + " Combined: " + allForms)
		
		GoToState("Waiting")
	EndEvent
EndState
