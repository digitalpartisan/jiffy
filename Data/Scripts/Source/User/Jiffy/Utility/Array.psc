Scriptname Jiffy:Utility:Array Hidden Const

Var Function random(Var[] data) Global
	if (!data || !data.Length)
		return None
	endif
	
	return data[Utility.RandomInt(0, data.Length - 1)]
EndFunction

Var[] Function copy(Var[] myArray) Global
	Var[] copy = new Var[0]

	if (!myArray || !myArray.Length)
		return copy
	endif
	
	Int iCounter = 0
	while (iCounter < myArray.Length)
		copy.Add(myArray[iCounter])
		iCounter += 1
	endWhile
	
	return copy
EndFunction

Var[] Function append(Var[] existing, Var[] additional) Global
	Var[] result = copy(existing)
	
	if (!additional || !additional.Length)
		return result
	endif
	
	Int iCounter = 0
	while (iCounter < additional.Length)
		if (additional[iCounter])
			result.Add(additional[iCounter])
		endif
		
		iCounter += 1
	endWhile
	
	return result
EndFunction
