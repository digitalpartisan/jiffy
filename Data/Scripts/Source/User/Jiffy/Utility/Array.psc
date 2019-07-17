Scriptname Jiffy:Utility:Array Hidden Const

Var Function random(Var[] data) Global
	if (!data || !data.Length)
		return None
	endif
	
	return data[Utility.RandomInt(0, data.Length - 1)]
EndFunction

Var[] Function copy(Var[] myArray) Global
	if (!myArray)
		return None
	endif
	
	Var[] copy = new Var[0]
	Int iCounter = 0
	while (iCounter < myArray.Length)
		copy.Add(myArray[iCounter])
		iCounter += 1
	endWhile
	
	return copy
EndFunction

Var[] Function union(Var[] existing, Var[] additional) Global
	if (!existing || !additional || !additional.Length)
		return existing
	endif
	
	Var[] copy = copy(existing)
	
	Int iCounter = 0
	Var additionalItem = None
	while (iCounter < additional.Length)
		additionalItem = additional[iCounter]
		if (additionalitem && 0 > existing.Find(additionalItem))
			copy.Add(additionalItem)
		endif
		
		iCounter += 1
	endWhile
	
	return copy
EndFunction

Var[] Function subtract(Var[] existing, Var[] minus) Global
	if (!existing || !minus || !minus.Length)
		return existing
	endif
	
	Int iCounter = 0
	Var minusItem = None
	Int minusLocation = -1
	Var[] copy = copy(existing)
	
	while (iCounter < minus.Length)
		minusItem = minus[iCounter]
		minusLocation = existing.Find(minusItem)
		if (minusItem && 0 <= minusLocation)
			copy.Remove(minusLocation)
		endif
		
		iCounter += 1
	endWhile
	
	return copy
EndFunction

Var[] Function intersection(Var[] arrayOne, Var[] arrayTwo) Global
	if (!arrayOne || !arrayOne.Length || !arrayTwo || !arrayTwo.Length)
		return None
	endif
	
	Var[] results = new Var[0]
	Var[] longer = arrayOne
	Var[] shorter = arrayTwo
	if (arrayOne.Length < arrayTwo.Length)
		longer = arrayTwo
		shorter = arrayOne
	endif
	
	Int iCounter = 0
	Var current = None
	while (iCounter < shorter.Length)
		current = shorter[iCounter]
		if (current && 0 <= longer.Find(current))
			results.Add(current)
		endif
		
		iCounter += 1
	endWhile
	
	return results
EndFunction

Var[] Function difference(Var[] arrayOne, Var[] arrayTwo) Global
	if (!arrayOne || !arrayOne.Length || !arrayTwo || !arrayTwo.Length)
		return None
	endif
	
	Var[] results = new Var[0]
	Var[] longer = arrayOne
	Var[] shorter = arrayTwo
	if (arrayOne.Length < arrayTwo.Length)
		longer = arrayTwo
		shorter = arrayOne
	endif
	
	Int iCounter = 0
	Var current = None
	while (iCounter < shorter.Length)
		current = shorter[iCounter]
		if (current && 0 > longer.Find(current))
			results.Add(current)
		endif
		
		iCounter += 1
	endWhile
	
	while (iCounter < longer.Length)
		current = longer[iCounter]
		if (current)
			results.Add(current)
		endif
		
		iCounter += 1
	endWhile
	
	return results
EndFunction
