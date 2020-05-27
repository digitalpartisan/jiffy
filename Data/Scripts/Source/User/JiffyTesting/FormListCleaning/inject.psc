Scriptname JiffyTesting:FormListCleaning:Inject extends ObjectReference

JiffyTesting:FormListCleaning Property JiffyTestingFormListHandler Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() != akActionRef)
		return
	endif
	
	JiffyTestingFormListHandler.performInjections()
EndEvent
