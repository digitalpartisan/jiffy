Scriptname JiffyTesting:UpdateableReactor extends Jiffy:list:Updateable:Form

JiffyTesting:UpdateableList Property TheList Auto Const Mandatory
ObjectReference Property TheContainer Auto Const Mandatory

Event OnQuestInit()
	RegisterForCustomEvent(TheList, "Updated")
	TheList.populate()
EndEvent

Event Jiffy:List:Updateable.Updated(Jiffy:List:Updateable akSender, Var[] akArgs)
	TheContainer.RemoveAllItems()
	
	if (!TheList.hasData())
		return
	endif
	
	Int iCounter = 0
	Int iSize = TheList.getSize()
	
	while (iCounter < iSize)
		TheContainer.AddItem(TheList.getForm(iCounter))
		iCounter += 1
	endWhile
EndEvent
