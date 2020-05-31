Scriptname Jiffy:List:Updateable extends Jiffy:List Hidden
{This list script has the ability to update its contents and send an event if its content have changed since the last time the list was populated.
In addition to implementing the functions described in the documentation on Jiffy:List, users of this script should consider implementing populateBehavior() as well since it is required to gauge whether or not an update has occurred.}

CustomEvent Updated

Var[] updateData = None

Var[] Function getUpdateData()
	return updateData
EndFunction

Var[] Function setUpdateData(Var[] avUpdateData)
	updateData = avUpdateData
EndFunction

Function sendUpdated()
	Jiffy:List:Logger.logUpdated(self)
	SendCustomEvent("Updated")
EndFunction

Function clearUpdateData()
	setUpdateData(None)
EndFunction

Bool Function hasDataChanged()
{Detects differences between the current data set and the refreshed data set.  Returns true if differences are detected and false otherwise.}
	Var[] currentData = getData()
	Var[] newData = getUpdateData()
	
	if (!currentData && !newData)
		return false
	endif
	
	if ( (!currentData || !newData) || (currentData.Length != newData.Length) )
		return true
	endif
	
	Int iCounter = 0
	while (iCounter < currentData.Length)
		if (!equalityCheck(currentData[iCounter], newData[iCounter]))
			return true
		endif
		
		iCounter += 1
	endWhile
	
	return false
EndFunction

Function update()
{Refreshes the data and performs the comparison.  Fires the event if appropriate.}
	setUpdateData(populateBehavior())
	
	if (hasDataChanged())
		setData(Jiffy:Utility:Array.copy(getUpdateData()))
		sendUpdated()
	endif
	
	clearUpdateData()
EndFunction
