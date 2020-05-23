Scriptname Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior)
EndFunction

Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior[] Function searchCleaners(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior[]
EndFunction

Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior Function searchOneCleaner(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:BackgroundProcessor:FormListCleaner:ChronicleBehavior
EndFunction
