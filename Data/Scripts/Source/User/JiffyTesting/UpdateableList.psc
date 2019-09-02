Scriptname JiffyTesting:UpdateableList extends Jiffy:List:Updateable:Form

Var[] trueData = None

Function addTrueData(Var avItem)
	if (!trueData)
		trueData = new Var[0]
	endif
	
	trueData.Add(avItem)
EndFunction

Var[] Function populateBehavior()
	return trueData
EndFunction
