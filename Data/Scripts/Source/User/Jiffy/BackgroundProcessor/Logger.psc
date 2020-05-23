Scriptname Jiffy:BackgroundProcessor:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Background Processor"
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

Bool Function logReceivedItem(Jiffy:BackgroundProcessor processor, Var item) Global
	return log(processor + " received item " + item)
EndFunction

Bool Function logNoProcessingLogic(Jiffy:BackgroundProcessor processor) Global
	return error(processor + " has no processing logic")
EndFunction

Bool Function logProcessingItem(Jiffy:BackgroundProcessor processor, Var item) Global
	return log(processor + " is processing item " + item)
EndFunction

Bool Function logDoneProcessingItem(Jiffy:BackgroundProcessor processor, Var item) Global
	return log(Processor + " is done processing item " + item)
EndFunction
