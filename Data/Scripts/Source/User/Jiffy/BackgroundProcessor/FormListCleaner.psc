Scriptname Jiffy:BackgroundProcessor:FormListCleaner extends Jiffy:BackgroundProcessor

Import Jiffy:Utility:FormList
Import Jiffy:BackgroundProcessor:FormListCleaner:Queue

Function processLogic(Var item)
	ListData data = item as ListData
	if (!data || !data.List)
		return
	endif
	
	Jiffy:BackgroundProcessor:Logger.logProcessingItem(self, data)
	
	Form[] cleanForms = getCleanForms(data.List)
	FormList[] children = adjustFormListContents(data.List, cleanForms)
	data.recursive && self.cleanBulk(children)
	
	Jiffy:BackgroundProcessor:Logger.logDoneProcessingItem(self, data)
EndFunction

Function clean(FormList targetList, Bool bRecursive = true)
	process(prepData(targetList, bRecursive))
EndFunction

Function cleanBulk(FormList[] formLists, Bool bRecursive = true)
	if (!formLists || !formLists.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < formLists.Length)
		self.clean(formLists[iCounter], bRecursive)
		iCounter += 1
	endWhile
EndFunction
