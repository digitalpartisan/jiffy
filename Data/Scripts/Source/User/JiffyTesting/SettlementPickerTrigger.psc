Scriptname JiffyTesting:SettlementPickerTrigger extends ObjectReference

Jiffy:Settlement:Picker:Handler Property JiffyTesting_Settlement_Picker_Handler Auto Const Mandatory
ObjectReference Property SanctuaryWorkshopReference Auto Const Mandatory
Location Property RedRocketTruckStopLocation Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() == akActionRef)
		Jiffy:Logger.log("Chosen workshop is " + JiffyTesting_Settlement_Picker_Handler.pickWithDefault(RedRocketTruckStopLocation, SanctuaryWorkshopReference as WorkshopScript))
	endif
EndEvent
