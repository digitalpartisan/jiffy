Scriptname Jiffy:Teleporter extends Quest

Bool Property TeleportOut = true Auto Const
Bool Property TeleportIn = true Auto Const
Bool Property TeleportFollowers = true Auto Const

Spell Property TeleportInSpell Auto Const Mandatory
{autofill}
Spell Property TeleportPlayerInSpell Auto Const Mandatory
{autofill}
Spell Property TeleportPlayerOutSpell Auto Const Mandatory
{autofill}

Float Property TeleportOutAnimationTime = 2.0 Auto Const
Float Property TeleportInAnimationTime = 2.0 Auto Const

ObjectReference destinationHandle = None

ObjectReference Function getDestination()
	return destinationHandle
EndFunction

Bool Function canAct()
	return getDestination() as Bool
EndFunction

Bool Function setDestination(ObjectReference newValue)
	destinationHandle = newValue
	return canAct()
EndFunction

Function clearDestination()
	setDestination(None)
EndFunction

Function preRun()

EndFunction

Function preTeleport()

EndFunction

Function teleportOut()
	if (!TeleportOut)
		return
	endif

	Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, false)
	Game.FadeOutGame(true, false, 0, TeleportOutAnimationTime, true)
	Utility.Wait(TeleportOutAnimationTime)
EndFunction

Function preMove()
	
EndFunction

Function moveFollowers()
	if (!TeleportFollowers)
		return
	endif

	Actor[] followers = Game.GetPlayerFollowers()
	if (!followers || !followers.Length)
		return
	endif
	
	Actor aPlayer = Game.GetPlayer()
	Int iCounter = 0
	while (iCounter < followers.Length)
		followers[iCounter] && followers[iCounter].MoveTo(aPlayer)
		iCounter += 1
	endWhile
EndFunction

Function move(Bool bFromTerminal = false)
	if (!canAct())
		return
	endif

	if (bFromTerminal)
		Game.GetPlayer().MoveTo(getDestination())
		TeleportFollowers && moveFollowers()
	else
		if (TeleportFollowers)
			Game.FastTravel(getDestination())
		else
			Game.GetPlayer().MoveTo(getDestination())
		endif
	endif
EndFunction

Function postMove()

EndFunction

Function addSpellToFollowers()
	if (!TeleportFollowers)
		return
	endif

	Actor[] followers = Game.GetPlayerFollowers()
	Int iCounter = 0
	while (iCounter < followers.Length)
		followers[iCounter].AddSpell(TeleportInSpell, false)
		iCounter += 1
	endWhile
EndFunction

Function teleportIn()
	if (!TeleportIn)
		return
	endif

	TeleportFollowers && addSpellToFollowers()
	Game.GetPlayer().AddSpell(TeleportPlayerInSpell, false)
	Utility.Wait(TeleportInAnimationTime)
EndFunction

Function postTeleport()

EndFunction

Function postRun()

EndFunction

Function act(ObjectReference destinationRef, Bool bFromTerminal = false)
	if (!setDestination(destinationRef))
		return
	endif

	preRun()

	InputEnableLayer controls = InputEnableLayer.create()
	controls.DisablePlayerControls(abLooking = true, abSneaking = true, abJournalTabs = true, abRunning = false)

	preTeleport()
	!bFromTerminal && teleportOut()
	preMove()
	move(bFromTerminal)
	controls.DisablePlayerControls(abLooking = true, abSneaking = true, abJournalTabs = true, abRunning = false)
	postMove()
	teleportIn()
	postTeleport()

	controls.EnablePlayerControls()
	controls.Delete()

	postRun()

	clearDestination()
EndFunction

Function actFromTerminal(ObjectReference destinationRef)
	act(destinationRef, true)
EndFunction
