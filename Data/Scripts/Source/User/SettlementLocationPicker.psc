Scriptname SettlementLocationPicker extends WorkshopNPCScript

Group SettlementLocationPickerSettings
	Keyword Property SelectionKeyword Auto Const Mandatory
	FormList Property RequiredKeywords = None Auto Const
	FormList Property ExcludedKeywords = None Auto Const
	
	Bool Property RequireOwnership = true Auto Const
	Bool Property ExcludeZeroPopulation = false Auto Const
	Bool Property TurnOffHeader = false Auto Const
	Bool Property OnlyPotentialVassalSettlements = false Auto Const
	Bool Property DisableReservedByQuests = false Auto Const
	
	Message Property ConfirmationMessage = None Auto Const
EndGroup

Event OnWorkshopNPCTransfer(Location akNewWorkshopLocation, Keyword akActionKW)
	if (SelectionKeyword == akActionKW)
		WorkshopParent.unassignActor(self, true)
	endif
EndEvent

Location Function pickLocation(Location akSelectLocation = None)
	return OpenWorkshopSettlementMenuEx(SelectionKeyword, ConfirmationMessage, akSelectLocation, RequiredKeywords, ExcludedKeywords, ExcludeZeroPopulation, RequireOwnership, TurnOffHeader, OnlyPotentialVassalSettlements, DisableReservedByQuests)
EndFunction

WorkshopScript Function pickWorkshop(Location akSelectLocation = None)
	Location selectedLocation = pickLocation(akSelectLocation)
	if (selectedLocation)
		return WorkshopParent.getWorkshopFromLocation(selectedLocation)
	endif
	
	return None
EndFunction
