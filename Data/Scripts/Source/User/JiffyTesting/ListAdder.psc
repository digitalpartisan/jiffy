Scriptname JiffyTesting:ListAdder extends ObjectReference

Jiffy:List Property MyList Auto Const Mandatory
Form Property MyForm Auto Const Mandatory
JiffyTesting:BasicListContainerHandler Property JiffyTesting_List_Basic_Handler Auto Const Mandatory
Message Property JiffyTesting_List_ActivateText_Add Auto Const Mandatory
Message Property JiffyTesting_List_ActivateText_Remove Auto Const Mandatory

Auto State PreAdd
	Event OnBeginState(String asOldState)
		JiffyTesting_List_Basic_Handler.updateContainer()
		SetActivateTextOverride(JiffyTesting_List_ActivateText_Add)
		BlockActivation(false)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Adding")
	EndEvent
EndState

State Adding
	Event OnBeginState(String asOldState)
		MyList.Add(MyForm)
		GoToState("PostAdd")
	EndEvent
EndState

State PostAdd
	Event OnBeginState(String asOldState)
		JiffyTesting_List_Basic_Handler.updateContainer()
		SetActivateTextOverride(JiffyTesting_List_ActivateText_Remove)
		BlockActivation(false)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(true, true)
		GoToState("Removing")
	EndEvent
EndState

State Removing
	Event OnBeginState(String asOldState)
		MyList.Remove(MyForm)
		GoToState("PreAdd")
	EndEvent
EndState
