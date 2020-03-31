Scriptname Jiffy:Utility:Plugin Hidden Const

String Function getFirstInstalledPlugin(String[] asPlugins) Global
	if (!asPlugins || !asPlugins.Length)
		return None
	endif
	
	Int iCounter = 0
	while (iCounter < asPlugins.Length)
		if (Game.IsPluginInstalled(asPlugins[iCounter]))
			return asPlugins[iCounter]
		endif
		
		iCounter += 1
	endWhile
	
	return None
EndFunction
