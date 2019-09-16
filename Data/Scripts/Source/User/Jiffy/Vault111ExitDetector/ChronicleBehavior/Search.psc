Scriptname Jiffy:Vault111ExitDetector:ChronicleBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:Vault111ExitDetector:ChronicleBehavior)
EndFunction

Jiffy:Vault111ExitDetector:ChronicleBehavior[] Function searchDetectors(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:Vault111ExitDetector:ChronicleBehavior[]
EndFunction

Jiffy:Vault111ExitDetector:ChronicleBehavior Function searchOneDetector(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:Vault111ExitDetector:ChronicleBehavior
EndFunction
