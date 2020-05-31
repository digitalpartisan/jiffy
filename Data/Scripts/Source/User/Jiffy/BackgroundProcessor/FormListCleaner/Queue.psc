Scriptname Jiffy:BackgroundProcessor:FormListCleaner:Queue extends Jiffy:List:Queue
{See Jiffy:List:Queue and Jiffy:BackgroundProcessor:FormListCleaner.}

Struct ListData
	FormList list = None
	Bool recursive = false
EndStruct

ListData Function prepData(FormList list, Bool recursive = true) Global
	if (!list)
		return None
	endif
	
	ListData data = new ListData
	data.list = list
	data.recursive = recursive
	
	return data
EndFunction

Bool Function equalityCheck(Var avItemOne, Var avItemTwo)
	ListData dataOne = avItemOne as ListData
	ListData dataTwo = avItemTwo as ListData
	
	if (!dataOne && !dataTwo)
		return true
	endif
	
	if (!dataOne || !dataTwo)
		return false
	endif
	
	return dataOne.list == dataTwo.list
EndFunction

ListData Function getList(Int iIndex)
	return get(iIndex) as ListData
EndFunction

ListData[] Function getListData()
	return getData() as ListData[]
EndFunction

ListData Function peekListData()
	return peek() as ListData
EndFunction

ListData Function pollForm()
	return poll() as ListData
EndFunction
