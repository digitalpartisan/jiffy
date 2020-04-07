Scriptname Jiffy:Utility:FormList:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:Utility:FormList:ChronicleBehavior)
EndFunction

Jiffy:Utility:FormList:ChronicleBehavior[] Function searchDetectors(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:Utility:FormList:ChronicleBehavior[]
EndFunction

Jiffy:Utility:FormList:ChronicleBehavior Function searchOneDetector(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:Utility:FormList:ChronicleBehavior
EndFunction
