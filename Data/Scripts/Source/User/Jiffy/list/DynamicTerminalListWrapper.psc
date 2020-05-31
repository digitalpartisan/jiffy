Scriptname Jiffy:List:DynamicTerminalListWrapper extends DynamicTerminal:ListWrapper Hidden
{Enables pagination over a Jiffy:List data set.  See DynamicTerminal:ListWrapper}

Jiffy:List Function getRawData()
{Overrite this in child scripts to fully implement this type of ListWrapper}
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
