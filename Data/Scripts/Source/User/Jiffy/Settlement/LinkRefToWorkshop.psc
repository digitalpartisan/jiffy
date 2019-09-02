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
	
	ObjectReference linkedRef = None
	if (bPlaced)
		linkedRef = self
	endif

	Jiffy:Logger:Settlement.logWorkshopLink(self, workshopRef, MyKeyword, linkedRef)
	workshopRef.SetLinkedRef(linkedRef, MyKeyword)
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
