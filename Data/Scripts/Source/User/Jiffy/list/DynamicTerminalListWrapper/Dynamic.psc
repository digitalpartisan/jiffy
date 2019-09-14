Scriptname Jiffy:list:DynamicTerminalListWrapper:Dynamic extends Jiffy:list:DynamicTerminalListWrapper

Jiffy:List myList = None

Jiffy:List Function getRawData()
	return myList
EndFunction

Function setList(Jiffy:List newValue)
	myList = newValue
EndFunction
