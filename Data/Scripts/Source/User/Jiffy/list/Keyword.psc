Scriptname Jiffy:List:Keyword extends Jiffy:List
{A list of Keyword records.  Note especially the equalityCheck() logic as this is not possible on Var objects themselves.}

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
	return (avItemOne as Keyword) == (avItemTwo as Keyword)
EndFunction

Keyword Function getForm(Int iIndex)
	return get(iIndex) as Keyword
EndFunction

Keyword[] Function getKeywordData()
	return getData() as Keyword[]
EndFunction

Keyword Function inspectKeyword()
	return inspect() as Keyword
EndFunction

Keyword Function iterateKeyword()
	return iterate() as Keyword
EndFunction

Bool Function addBulkKeywords(Keyword[] keywords)
	return addBulk(keywords as Var[])
EndFunction

Bool Function removeBulkKeywords(Keyword[] keywords)
	return removeBulk(keywords as Var[])
EndFunction
