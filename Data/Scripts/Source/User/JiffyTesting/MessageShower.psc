Scriptname JiffyTesting:MessageShower extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	JiffyTesting:MessageContainer.getInstance().getTestMessage().Show()
EndEvent
