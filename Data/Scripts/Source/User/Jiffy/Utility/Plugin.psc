Scriptname Jiffy:Utility:Plugin Hidden Const

String Function getFirstInstalledPlugin(String[] asPlugins) Global
{Searches asPlugins and returns the first value that corresponds to an installed plugin.  Returns None if no plugin matching any of these names is installed.}
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
