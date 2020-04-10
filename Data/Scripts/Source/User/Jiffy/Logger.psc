Scriptname Jiffy:Logger Hidden Const DebugOnly

String Function getName() Global
	return "Jiffy"
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Loggout.log(getName(), sMessage)
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Loggout.warn(getName(), sMessage)
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Loggout.error(getName(), sMessage)
EndFunction

Bool Function cleaning(FormList aflList) Global
	return log(aflList + " is being cleaned")
EndFunction

Bool Function doneCleaning(FormList aflList) Global
	return log(aflList + " is done being cleaned")
EndFunction
