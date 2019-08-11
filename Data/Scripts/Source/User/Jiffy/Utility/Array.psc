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

Var[] Function union(Var[] existing, Var[] additional) Global
	Var[] result = copy(existing)

	if (!additional || !additional.Length)
		return result
	endif

	Int iCounter = 0
	Var additionalItem = None
	while (iCounter < additional.Length)
		additionalItem = additional[iCounter]
		if (additionalitem && 0 > result.Find(additionalItem))
			result.Add(additionalItem)
		endif
		
		iCounter += 1
	endWhile
	
	return result
EndFunction

Var[] Function subtract(Var[] existing, Var[] minus) Global
	Var[] result = copy(existing)

	if (!minus || !minus.Length)
		return result
	endif
	
	Int iCounter = 0
	Var minusItem = None
	Int minusLocation = -1
	
	while (iCounter < minus.Length)
		minusItem = minus[iCounter]
		minusLocation = result.Find(minusItem)
		if (minusItem && 0 <= minusLocation)
			result.Remove(minusLocation)
		endif
		
		iCounter += 1
	endWhile
	
	return result
EndFunction

Var[] Function intersection(Var[] arrayOne, Var[] arrayTwo) Global
	Var[] results = new Var[0]

	if (!arrayOne || !arrayOne.Length || !arrayTwo || !arrayTwo.Length)
		return results
	endif
	
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
	Var[] results = new Var[0]

	if (!arrayOne || !arrayOne.Length || !arrayTwo || !arrayTwo.Length)
		return results
	endif
	
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
