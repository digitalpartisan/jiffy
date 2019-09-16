Scriptname Jiffy:HolotapeRetainer:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:HolotapeRetainer:ChronicleBehavior)
EndFunction

Jiffy:HolotapeRetainer:ChronicleBehavior[] Function searchRetainers(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:HolotapeRetainer:ChronicleBehavior[]
EndFunction

Jiffy:HolotapeRetainer:ChronicleBehavior Function searchOneRetainer(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:HolotapeRetainer:ChronicleBehavior
EndFunction
