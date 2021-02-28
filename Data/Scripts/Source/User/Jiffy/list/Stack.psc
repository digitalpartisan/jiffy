Scriptname Jiffy:List:Stack extends Jiffy:List

Bool Function push(Var vItem)
	return add(vItem)
EndFunction

Var Function pull()
	Var last = getLast()
	last && removeLast()
	return last
EndFunction
