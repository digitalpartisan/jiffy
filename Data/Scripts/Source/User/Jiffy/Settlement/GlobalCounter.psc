Scriptname Jiffy:Settlement:GlobalCounter extends ObjectReference Const

GlobalVariable Property MyGlobal Auto Const Mandatory
Float Property Scale = 1.0 Auto Const

Function handle(Bool bPlaced = true)
	if (!MyGlobal)
		return
	endif
	
	Float fAdjust = 1.0 * Scale
	if (!bPlaced)
		fAdjust = -1.0 * Scale
	endif
	
	Jiffy:Logger:Settlement.logGlobalAdjustment(self, MyGlobal, fAdjust)
	MyGlobal.Mod(fAdjust)
EndFunction

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	handle(false)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	handle()
EndEvent
