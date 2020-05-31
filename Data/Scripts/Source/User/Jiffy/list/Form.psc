Scriptname Jiffy:List:Form extends Jiffy:List
{A list of Form records.  Note especially the qualityCheck() logic as this is not possible on Var objects themselves.}

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
	return (avItemOne as Form) == (avItemTwo as Form)
EndFunction

Form Function getForm(Int iIndex)
	return get(iIndex) as Form
EndFunction

Form[] Function getFormData()
	return getData() as Form[]
EndFunction
