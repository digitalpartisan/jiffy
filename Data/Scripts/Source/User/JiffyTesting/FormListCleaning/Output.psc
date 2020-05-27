Scriptname JiffyTesting:FormListCleaning:Output extends ObjectReference

JiffyTesting:FormListCleaning Property JiffyTestingFormListHandler Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() != akActionRef)
		return
	endif
	
	JiffyTestingFormListHandler.outputList()
EndEvent
