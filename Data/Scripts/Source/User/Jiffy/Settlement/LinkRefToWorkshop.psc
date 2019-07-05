Scriptname Jiffy:Settlement:LinkRefToWorkshop extends ObjectReference Const

Keyword Property MyKeyword Auto Const Mandatory

Function handle(ObjectReference akReference, Bool bPlaced = true)
	if (!MyKeyword)
		return
	endif
	
	WorkshopScript workshopRef = akReference as WorkshopScript
	if (!workshopRef)
		return
	endif
	
	ObjectReference linkRef = None
	if (bPlaced)
		linkRef = self
	endif

	Jiffy:Logger:Settlement.logWorkshopLink(self, workshopRef, MyKeyword, linkRef)
	workshopRef.SetLinkedRef(linkRef, MyKeyword)
EndFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	handle(akReference)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	handle(akReference, false)
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	handle(akReference)
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	handle(akReference, false)
EndEvent
