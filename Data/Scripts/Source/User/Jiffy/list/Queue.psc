Scriptname Jiffy:List:Queue extends Jiffy:List Hidden
{This is a type of list intended to function as a queue with peek() and poll() behaviors.}

Var Function peek()
	if (hasData())
		return getData()[0]
	endif
	
	return None
EndFunction

Var Function poll()
	Var vFirst = peek()
	if (vFirst)
		removeAt(0)
	endif
	
	return vFirst
EndFunction
