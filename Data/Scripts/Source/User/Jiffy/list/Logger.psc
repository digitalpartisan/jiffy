Scriptname Jiffy:list:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "List"
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

Bool Function logAdded(Jiffy:List list, Var item) Global
	return log(list + " added item " + item)
EndFunction

Bool Function logRemoved(Jiffy:List list, Var item) Global
	return log(list + " removed item " + item)
EndFunction

Bool Function logCleared(Jiffy:List list) Global
	return log(list + " has been cleared")
EndFunction

Bool Function logCleaned(Jiffy:List list) Global
	return log(list + " has been cleaned")
EndFunction

Bool Function logUpdated(Jiffy:List:Updateable list) Global
	return log(list + " has been updated")
EndFunction

Bool Function logUpdateableNoData(Jiffy:List:Updateable list) Global
	return log(list + " had no data and still has no data")
EndFunction

Bool Function logUpdateableSomeData(Jiffy:List:Updateable list) Global
	return log(list + " either had no data and now does or had data and now does not")
EndFunction

Bool Function logUpdateableNoChange(Jiffy:List:Updateable list) Global
	return log(list + " detected no change in its data")
EndFunction

Bool Function logUpdateableSizeChange(Jiffy:List:Updateable list) Global
	return log(list + " detected a change in size of its data set")
EndFunction

Bool Function logDataValidation(Jiffy:List list) Global
	return log(list + " has validated its data")
EndFunction

Bool Function logFailedDataValidation(Jiffy:List list, Int iIndex, Var avItem) Global
	return log(list + " failed to validate its data at index " + iIndex + " with value " + avItem)
EndFunction

