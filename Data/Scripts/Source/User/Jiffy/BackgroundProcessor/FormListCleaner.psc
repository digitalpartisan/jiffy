Scriptname Jiffy:BackgroundProcessor:FormListCleaner extends Jiffy:BackgroundProcessor
{Cleans FormList records without holding up the process that invokes it.
The queue must be a Jiffy:BackgroundProcessor:FormListCleaner:Queue.
See Jiffy:BackgroundProcessor for more information.}

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
{Converts the input into something the queue in use by this object.}
	process(prepData(targetList, bRecursive))
EndFunction

Function cleanBulk(FormList[] formLists, Bool bRecursive = true)
{Queues each FormList specified, optionally requiring a recursive cleaning.}
	if (!formLists || !formLists.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < formLists.Length)
		self.clean(formLists[iCounter], bRecursive)
		iCounter += 1
	endWhile
EndFunction
