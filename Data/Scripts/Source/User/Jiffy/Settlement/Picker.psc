Scriptname Jiffy:Settlement:Picker extends WorkshopNPCScript
{
To use this script:

Make a new actor record for this purpose and only this purpose.
Make that actor essential and unique.
Strip any faction and/or AI package associations on that actor.
Set the following properties from the parent script:

bAllowMove: True
bCountsForPopulation: False
}

Group SettlementFilters
	FormList Property RequiredKeywords = None Auto Const
	{Which keywords a settlement reference must have to be included in the options the picker presents to the player.  If None, has no effect.}
	FormList Property ExcludedKeywords = None Auto Const
	{Which keywords a settlement must not have in order to be included in the picker's options.  If None, has no effect.}
	
	Bool Property RequireOwnership = true Auto Const
	{If true, unowned settlements will not appear in the picker's options.}
	Bool Property ExcludeZeroPopulation = false Auto Const
	{If true, only settlements with a population will appear in the picker's options.}
	Bool Property TurnOffHeader = true Auto Const
	{If true, no header will appear above the selection list.  Desirable because the limited default options involve moving a settler or assigning them a caravan route.}
	Bool Property OnlyPotentialVassalSettlements = false Auto Const
	{Has to do with Nuka-World vassal settlement logic.  Leave it alone unless you have a reason to tweak it.}
	Bool Property DisableReservedByQuests = false Auto Const
	{See notes on OnlyPotentialVassalSettlements.}
EndGroup

Group MiscSettlementPickerSettings
	Keyword Property SelectionKeyword = None Auto Const
	{The keyword used to tell the game engine what sort of selection is being made.}
	Message Property ConfirmationMessage = None Auto Const
	{The text shown to the player to confirm their selection.  A good opportunity to warn the player about what will happen if then choose to proceed.}
	Message Property NoSelectionMessage = None Auto Const
	{The message shown to the player when no location is selected, which is almost always a result of the player cancelling the selection process.}
EndGroup

Event OnWorkshopNPCTransfer(Location akNewWorkshopLocation, Keyword akActionKW)
	if (WorkshopParent.WorkshopAssignHome == akActionKW || WorkshopParent.WorkshopAssignCaravan == akActionKW || WorkshopParent.WorkshopAssignHomePermanentActor == akActionKW)
		WorkshopParent.unassignActor(self, true)
	endif
EndEvent

WorkshopScript Function pick(Location akSelectLocation = None)
	Jiffy:Logger:Settlement.logOpeningMenu(self)
	Location selectedLocation = OpenWorkshopSettlementMenuEx(SelectionKeyword, ConfirmationMessage, akSelectLocation, RequiredKeywords, ExcludedKeywords, ExcludeZeroPopulation, RequireOwnership, TurnOffHeader, OnlyPotentialVassalSettlements, DisableReservedByQuests)
	
	Jiffy:Logger:Settlement.logPickerResult(self, selectedLocation)
	
	if (!selectedLocation)
		if (NoSelectionMessage)
			NoSelectionMessage.Show()
		endif
		
		return None
	endif
	
	WorkshopScript workshopRef = WorkshopParent.getWorkshopFromLocation(selectedLocation)
	Jiffy:Logger:Settlement.logLocationSettlementMatch(self, selectedLocation, workshopRef)
	
	return workshopRef
EndFunction
