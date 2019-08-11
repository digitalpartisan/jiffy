Scriptname Jiffy:Logger:HolotapeRetainer Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Holotape Retainer"
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

Bool Function logGiving(Jiffy:HolotapeRetainer retainer, Holotape holotapeRecord, Bool bPlayerHad) Global
	return log(retainer + " is giving holotape " + holotapeRecord + " with player had " + bPlayerHad)
EndFunction

Bool Function logTaking(Jiffy:HolotapeRetainer retainer, Holotape holotapeRecord, Bool bSilent) Global
	return log(retainer + " is taking holotape " + holotapeRecord + " with silent " + bSilent)
EndFunction
