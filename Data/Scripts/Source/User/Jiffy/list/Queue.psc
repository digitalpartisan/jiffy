Scriptname Jiffy:List:Queue extends Jiffy:List Hidden
{This is a type of list intended to function as a queue with peek() and poll() behaviors.}

Var Function peek()
{Returns the first item in the list if there is one and None otherwise.}
	if (hasData())
		return getData()[0]
	endif
	
	return None
EndFunction

Var Function poll()
{Returns the first item in the list after removing it from the list.  Returns None if the list has no items.}
	Var vFirst = peek()
	if (vFirst)
		removeAt(0)
	endif
	
	return vFirst
EndFunction
