Scriptname Jiffy:Utility:Array Hidden Const

Bool Function isIndexValid(Int iIndex, Var[] theArray) Global
	return theArray && iIndex >= 0 && iIndex < theArray.Length
EndFunction

Var Function random(Var[] data) Global
{Returns a random Var out of the specified Var[].  None if the Var[] doesn't exist or has no content.}
	if (!data || !data.Length)
		return None
	endif
	
	return data[Utility.RandomInt(0, data.Length - 1)]
EndFunction

Var[] Function copy(Var[] myArray) Global
{Returns a separate Var[] instance with the same contents as the specified Var[].  Useful because arrays are passed by reference and sometimes, a copy is required.}
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
{Adds the items in additional to a copy of existing.  Returns a different array instance than either of the passed in arrays.}
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

String Function toString(Var[] list) Global
{Collapses the items in list into a string fit for logging.}
    String sResult = ""
    if (!list || !list.Length)
        return sResult
    endif

    Int iCounter = 0
    while (iCounter < list.Length)
        sResult += list[iCounter]
        if ( (list.Length - 1) == iCounter )
            sResult += " "
        endif
        iCounter += 1
    endWhile

    return sResult
EndFunction
