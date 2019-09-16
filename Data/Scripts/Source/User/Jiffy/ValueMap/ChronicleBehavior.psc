Scriptname Jiffy:ValueMap:ChronicleBehavior extends Chronicle:Package:CustomBehavior

Jiffy:ValueMap[] Property MyMaps Auto Const Mandatory

Jiffy:ValueMap[] Function getMaps()
	return MyMaps
EndFunction

Bool Function installBehavior()
	Jiffy:ValueMap.startBulk(getMaps())
	return true
EndFunction

Bool Function uninstallBehavior()
	Jiffy:ValueMap.stopBulk(getMaps())
	return true
EndFunction
