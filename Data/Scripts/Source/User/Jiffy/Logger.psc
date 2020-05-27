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

Bool Function cleaning(FormList aflList) Global
	return log(aflList + " is being cleaned")
EndFunction

Bool Function doneCleaning(FormList aflList) Global
	return log(aflList + " is done being cleaned")
EndFunction

String Function renderFormList(FormList targetList, String sPrefix = "") Global
	String sResult = ""
	if ("" == sPrefix)
		sResult += "\n\n"
	endif
	
	sResult += sPrefix + targetList + "\n"
	
	if (!targetList)
		return sResult
	endif
	
	sPrefix += "\t"
	Int iCounter = 0
	Int iSize = targetList.GetSize()
	Form current = None
	while (iCounter < iSize)
		current = targetList.GetAt(iCounter)
		if (current is FormList)
			sResult += renderFormList(current as FormList, sPrefix)
		else
			sResult += sPrefix + current + "\n"
		endif
		
		iCounter += 1
	endWhile
	
	if ("" == sPrefix)
		sResult += "\n\n"
	endif
	
	return sResult
EndFunction

Bool Function logFormList(FormList targetList) Global
	return log(renderFormList(targetList))
EndFunction
