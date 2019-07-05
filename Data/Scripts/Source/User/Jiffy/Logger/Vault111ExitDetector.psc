Scriptname Jiffy:Logger:Vault111ExitDetector Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Vault 111 Exit Detector"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(Jiffy:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logObserving(Vault111ExitDetector detector, Quest exitQuest) Global
	return log(detector + " is observing " + exitQuest)
EndFunction

Bool Function logStopObserving(Vault111ExitDetector detector, Quest exitQuest) Global
	return log(detector + " has stopped observing " + exitQuest)
EndFunction

Bool Function logStartingQuest(Vault111ExitDetector detector, Quest targetQuest) Global
	return log(detector + " is starting target quest " + targetQuest)
EndFunction

Bool Function logStageEvent(Vault111ExitDetector detector, Quest watchedQuest, Int stageID) Global
	return log(detector + " observed set stage event on " + watchedQuest + " for stage " + stageID)
EndFunction
