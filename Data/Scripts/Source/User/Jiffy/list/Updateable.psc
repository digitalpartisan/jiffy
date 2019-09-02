Scriptname Jiffy:List:Updateable extends Jiffy:List Hidden

CustomEvent Updated

Var[] updateData = None

Var[] Function getUpdateData()
	return updateData
EndFunction

Var[] Function setUpdateData(Var[] avUpdateData)
	updateData = avUpdateData
EndFunction

Function sendUpdated()
	SendCustomEvent("Updated")
EndFunction

Function clearUpdateData()
	setUpdateData(None)
EndFunction

Bool Function hasDataChanged()
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
	setUpdateData(populateBehavior())
	
	if (hasDataChanged())
		setData(getUpdateData())
		sendUpdated()
	endif
	
	clearUpdateData()
EndFunction
