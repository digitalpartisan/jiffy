Scriptname Jiffy:List:Queue extends Jiffy:List

Var Function peek()
	if (hasData())
		return getData()[0]
	endif
	
	return None
EndFunction

Var Function poll()
	Var vFirst = peek()
	if (vFirst)
		remove(0)
	endif
	
	return vFirst
EndFunction
