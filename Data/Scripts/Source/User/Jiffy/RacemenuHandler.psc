Scriptname Jiffy:RacemenuHandler extends ObjectReference

Int Property BodyEdit = 10 Auto Const
Int Property FaceEdit = 11 Auto Const
Int Property Mode = 1 Auto Const
{1 = Character regen, 2 = haircut, 3 = Plastic Surgery, 4 = face paint, will default to 1 if an invalid value is entered here}
String Property LooksMenu = "LooksMenu" Auto Const

Keyword Property AnimFaceArchetypePlayer Auto Const Mandatory
{Autofill}
Idle Property ElevatorFaceCamera Auto Mandatory
{Autofill}
Idle Property ElevatorBodyCamera Auto Mandatory
{Autofill}

InputEnableLayer RespecEnableLayer = None

Int Function getMode()
	Int iResult = 1

	if (2 == Mode || 3 == Mode || 4 == Mode)
		iResult = Mode
	endif

	return iResult
EndFunction

Function moveToMarker()

EndFunction

Function prepareEnvironment()
	
EndFunction

Event OnActivate(ObjectReference akActionRef)
	Actor aPlayer = Game.GetPlayer()
	if (akActionRef != aPlayer)
		return
	endif

	RegisterForMenuOpenCloseEvent(LooksMenu)
	RegisterForLooksMenuEvent()

	RespecEnableLayer = InputEnableLayer.Create()
	RespecEnableLayer.DisablePlayerControls(abCamSwitch = true)

	aPlayer.SetHasCharGenSkeleton()
	aPlayer.ChangeAnimFaceArchetype(None)

	moveToMarker()
	prepareEnvironment()
	Game.ForceThirdPerson()
	Utility.Wait(0.01)

	aPlayer.PlayIdle(ElevatorFaceCamera)
	Game.ShowRaceMenu(uimode = getMode())
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (LooksMenu != asMenuName || abOpening)
		return
	endif

	RespecEnableLayer.Delete()
	RespecEnableLayer = None

	UnregisterForMenuOpenCloseEvent(LooksMenu)
	UnregisterForLooksMenuEvent()

	Game.ForceFirstPerson()
	Actor aPlayer = Game.GetPlayer()
	aPlayer.SetHasCharGenSkeleton(false)
	aPlayer.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)
EndEvent

Event OnLooksMenuEvent(int aiFlavor)
	BodyEdit == aiFlavor && Game.GetPlayer().PlayIdle(ElevatorBodyCamera)
	FaceEdit == aiFlavor && Game.GetPlayer().PlayIdle(ElevatorFaceCamera)
EndEvent
