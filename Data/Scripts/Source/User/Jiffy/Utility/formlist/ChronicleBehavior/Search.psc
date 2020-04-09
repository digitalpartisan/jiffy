Scriptname Jiffy:Utility:FormList:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:Utility:FormList:ChronicleBehavior)
EndFunction

Jiffy:Utility:FormList:ChronicleBehavior[] Function searchFormLists(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:Utility:FormList:ChronicleBehavior[]
EndFunction

Jiffy:Utility:FormList:ChronicleBehavior Function searchOneFormList(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:Utility:FormList:ChronicleBehavior
EndFunction
