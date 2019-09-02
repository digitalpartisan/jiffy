Scriptname Jiffy:list:Updateable:Form extends Jiffy:list:Updateable

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
	return (avItemOne as Form) == (avItemtwo as Form)
EndFunction

Form Function getForm(Int iIndex)
	return get(iIndex) as Form
EndFunction

Form[] Function getFormData()
	return getData() as Form[]
EndFunction
