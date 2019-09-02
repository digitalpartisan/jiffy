Scriptname JiffyTesting:BasicListContainerHandler extends Quest

ObjectReference Property ContainerReference Auto Const Mandatory
Jiffy:List Property TheList Auto Const Mandatory

Function updateContainer()

EndFunction

Auto State Waiting
	Function updateContainer()
		GoToState("Updating")
	EndFunction
EndState

State Updating
	Event OnBeginState(String asOldState)
		ContainerReference.RemoveAllItems()
		
		Int iCounter = 0
		Int iSize = TheList.GetSize()
		while (iCounter < iSize)
			ContainerReference.AddItem(TheList.get(iCounter) as Form)
			iCounter += 1
		endWhile
		
		GoToState("Waiting")
	EndEvent
EndState
