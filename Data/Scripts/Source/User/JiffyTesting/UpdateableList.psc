Scriptname JiffyTesting:UpdateableList extends Jiffy:List:Updateable:Form

Var[] trueData = None

Function addTrueData(Var avItem)
	if (!trueData)
		trueData = new Var[0]
	endif
	
	trueData.Add(avItem)
	
	Jiffy:List:Logger.log("The contents are now: " + trueData)
	
	update()
EndFunction

Var[] Function populateBehavior()
	return trueData
EndFunction
