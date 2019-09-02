Scriptname Jiffy:Logger:List Hidden Const DebugOnly

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
	return log("List " + list + " added item " + item)
EndFunction

Bool Function logRemoved(Jiffy:List list, Var item) Global
	return log("List " + list + " removed item " + item)
EndFunction

Bool Function logCleared(Jiffy:List list) Global
	return log("List " + list + " has been cleared")
EndFunction

Bool Function logCleaned(Jiffy:List list) Global
	return log("List " + list + " has been cleaned")
EndFunction

Bool Function logUdpated(Jiffy:List:Updateable list) Global
	return log("List " + list + " has been updated")
EndFunction
