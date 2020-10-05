Scriptname Jiffy:Logger Hidden Const DebugOnly

String Function getName() Global
	return "Jiffy"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logCanaryCall( Quest callingObject, String asScriptName) Global
	String[] tags = new String[0]
	return log(callingObject + " is calling Canary as " + asScriptName, tags)
EndFunction
