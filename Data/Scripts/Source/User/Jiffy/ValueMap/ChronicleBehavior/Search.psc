Scriptname Jiffy:ValueMap:ChronicleBehavior:Search extends Chronicle:Package:custombehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as Jiffy:ValueMap:ChronicleBehavior)
EndFunction

Jiffy:ValueMap:ChronicleBehavior[] Function searchValueMaps(Chronicle:Package targetPackage)
	return search(targetPackage) as Jiffy:ValueMap:ChronicleBehavior[]
EndFunction

Jiffy:ValueMap:ChronicleBehavior Function searchOneValueMap(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as Jiffy:ValueMap:ChronicleBehavior
EndFunction
