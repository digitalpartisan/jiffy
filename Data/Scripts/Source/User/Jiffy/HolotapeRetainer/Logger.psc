Scriptname Jiffy:HolotapeRetainer:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Holotape Retainer")
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Logger.log(sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Logger.warn(sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Logger.error(sMessage, getTags())
EndFunction

Bool Function logGiving(Jiffy:HolotapeRetainer retainer, Holotape holotapeRecord, Bool bPlayerHad, Bool bForceSilent) Global
	return log(retainer + " is giving holotape " + holotapeRecord + " with player had " + bPlayerHad + " and force silent " + bForceSilent)
EndFunction

Bool Function logTaking(Jiffy:HolotapeRetainer retainer, Holotape holotapeRecord, Bool bSilent) Global
	return log(retainer + " is taking holotape " + holotapeRecord + " with silent " + bSilent)
EndFunction

Bool Function logStarting(Jiffy:HolotapeRetainer retainer) Global
	return log(retainer + " is starting up")
EndFunction

Bool Function logStopping(Jiffy:HolotapeRetainer retainer) Global
	return log(retainer + " is shutting down")
EndFunction
