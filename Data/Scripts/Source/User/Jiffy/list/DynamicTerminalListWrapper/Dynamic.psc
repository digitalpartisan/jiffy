Scriptname Jiffy:list:DynamicTerminalListWrapper:Dynamic extends Jiffy:List:DynamicTerminalListWrapper
{Enables pagination over a Jiffy:List which can be set at will.  See Jiffy:List:DynamicTerminalListWrapper and DynamicTerminal:ListWrapper.}

Jiffy:List myList = None

Jiffy:List Function getRawData()
	return myList
EndFunction

Function setList(Jiffy:List newValue)
	myList = newValue
EndFunction
