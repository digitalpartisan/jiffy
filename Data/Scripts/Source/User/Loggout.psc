Scriptname Loggout Hidden Const DebugOnly

Bool Function open(String sLogName) Global
	if ("" == sLogName)
		Debug.Trace("[Loggout] cannot open custom log, no log name provided", 2)
		return false
	endif

	return Debug.OpenUserLog(sLogName)
EndFunction

String Function buildMessage(String sBaseMessage, Bool bSwitch, string sTrueOption, String sFalseOption) Global
	if (bSwitch)
		return sBaseMessage + sTrueOption
	else
		return sBaseMessage + sFalseOption
	endif
EndFunction

String Function buildTags(String[] tags = None) Global
	if (None == tags || 0 == tags.Length)
		return ""
	endif
	
	String sTagSet = ""
	String sTag = ""
	Int iCounter = 0
	While (iCounter < tags.Length)
		sTag = tags[iCounter]
		if ("" != sTag)
			sTagSet += "["+ sTag + "]"
		endif
		iCounter += 1
	EndWhile
	
	return sTagSet
EndFunction

Bool Function write(String sLogName, String sMessage, String[] tags = None, Int iLevel = 0) Global
	if ("" == sLogName)
		Debug.Trace("[Loggout] cannot write to custom log, no long name provided", 2)
		return false
	endif

	String sWholeMessage = sMessage
	String sTags = buildTags(tags)
	if ("" != sTags)
		sWholeMessage = sTags + " " + sWholeMessage
	endif
	
	if (Debug.TraceUser(sLogName, sWholeMessage, iLevel))
		return true
	else
		open(sLogName)
		return Debug.TraceUser(sLogName, sWholeMessage, iLevel)
	endif
EndFunction

Bool Function log(String sLogName, String sMessage, String[] tags = None) Global
	return write(sLogName, sMessage, tags, 0)
EndFunction

Bool Function warn(String sLogName, String sMessage, String[] tags = None) Global
	return write(sLogName, sMessage, tags, 1)
EndFunction

Bool Function error(String sLogName, String sMessage, String[] tags = None) Global
	return write(sLogName, sMessage, tags, 2)
EndFunction
