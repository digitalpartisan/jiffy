Scriptname Jiffy:Reference:DropSpawner extends ObjectReference

Form Property SpawnMe Auto Const Mandatory

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer)
		return
	endif

	akOldContainer.PlaceAtMe(SpawnMe, 1, true, false, false)
	Delete()
EndEvent
