Scriptname Jiffy:Logger:Settlement Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Settlement"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Loggout.log(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Loggout.warn(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Loggout.error(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logopeningMenu(Jiffy:Settlement:Picker pickerRef) Global
	return log("Location picker " + pickerRef + " is opening settlement menu")
EndFunction

Bool Function logLocationSettlementMatch(Jiffy:Settlement:Picker pickerRef, Location locationValue, WorkshopScript workshopRef) Global
	return log("Location picker " + pickerRef + " has matched location " + locationValue + " to workshop " + workshopRef)
EndFunction

Bool Function logWorkshopLink(Jiffy:Settlement:LinkRefToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkRef) Global
	return log(linker + " is linking to workshop " + workshopRef + " " + linkKeyword + " " + linkRef)
EndFunction

Bool Function logGlobalAdjustment(Jiffy:Settlement:GlobalCounter counter, GlobalVariable variable, Float adjustment) Global
	return log(counter + " is adjusting " + variable + " by " + adjustment)
EndFunction

Bool Function logPickerResult(Jiffy:Settlement:Picker picker, Location result) Global
	return log(picker + " has selected location " + result)
EndFunction
