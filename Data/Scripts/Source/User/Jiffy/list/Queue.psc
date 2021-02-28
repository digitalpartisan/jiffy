Scriptname Jiffy:List:Queue extends Jiffy:List Hidden
{This is a type of list intended to function as a queue with peek() and poll() behaviors.}

Var Function peek()
{Returns the first item in the list if there is one and None otherwise.}
	return getFirst()
EndFunction

Var Function poll()
{Returns the first item in the list after removing it from the list.  Returns None if the list has no items.}
	Var vFirst = peek()
	vFirst && removeFirst()
	return vFirst
EndFunction
