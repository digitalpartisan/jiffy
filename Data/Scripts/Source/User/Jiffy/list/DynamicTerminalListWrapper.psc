Scriptname Jiffy:List:DynamicTerminalListWrapper extends DynamicTerminal:ListWrapper Hidden

Jiffy:List Function getRawData()
	return None
EndFunction

Int Function getRawDataSize()
{See DynamicTerminal:ListWrapper.}
	return getRawData().getSize()
EndFunction

Form Function getRawDataItem(int iNumber)
{See DynamicTerminal:ListWrapper.}
	return getRawData().get(iNumber) as Form
EndFunction
