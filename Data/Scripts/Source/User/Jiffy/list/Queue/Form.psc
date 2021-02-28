Scriptname Jiffy:list:Queue:Form extends Jiffy:list:Queue

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
	return (avItemOne as Form) == (avItemtwo as Form)
EndFunction

Form Function getForm(Int iIndex)
	return get(iIndex) as Form
EndFunction

Form[] Function getFormData()
	return getData() as Form[]
EndFunction

Form Function peekForm()
	return peek() as Form
EndFunction

Form Function pollForm()
	return poll() as Form
EndFunction

Form Function inspectForm()
	return inspect() as Form
EndFunction

Form Function iterateForm()
	return iterate() as Form
EndFunction

Bool Function addBulkForms(Form[] forms)
	return addBulk(forms as Var[])
EndFunction

Bool Function removeBulkForms(Form[] forms)
	return removeBulk(forms as Var[])
EndFunction
