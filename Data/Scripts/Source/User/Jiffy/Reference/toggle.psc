Scriptname Jiffy:Reference:Toggle extends ObjectReference

ObjectReference Property TargetReference Auto Const Mandatory
Message Property OffLabel Auto Const
Message Property OnLabel Auto Const
Sound Property OffSound Auto Const
Sound Property OnSound Auto Const
Sound Property PlaybackSound Auto Const
Bool Property SoundOnTarget = false Auto Const
Int Property AutoOffTimerID = 1 Auto Const
Float Property AutoOffSeconds = 3.0 Auto Const
Bool Property AutoOff = false Auto Const

Int iPlaybackID = -1

ObjectReference Function getReferenceForSound()
	if (SoundOnTarget)
		return targetReference
	endif
	
	return self
EndFunction

Sound Function getSound()
	return None
EndFunction

Function playSound(Bool bWaitForFinish = false)
	Sound theSound = getSound()
	if (!theSound)
		return
	endif
	
	if (bWaitForFinish)
		theSound.PlayAndWait(getReferenceForSound())
	else
		theSound.Play(getReferenceForSound())
	endif
EndFunction

Message Function getLabel()
	return None
EndFunction

Function setLabel()
	Message theLabel = getLabel()
	theLabel && setActivateTextOverride(theLabel)
EndFunction

Function toggle(ObjectReference akActionRef)
	
EndFunction

Event OnActivate(ObjectReference akActionRef)
	toggle(akActionRef)
EndEvent

Function handlePlaybackSound()
	
EndFunction

Auto State Off
	Event OnBeginState(String asOldState)
		playSound(true)
		handlePlaybackSound()
		TargetReference.Disable()
		setLabel()
	EndEvent
	
	Function toggle(ObjectReference akActionRef)
		GoToState("On")
	EndFunction
	
	Sound Function getSound()
		return OffSound
	EndFunction
	
	Message Function getLabel()
		return OffLabel
	EndFunction
	
	Function handlePlaybackSound()
		if (!PlaybackSound)
			return
		endif
		
		Sound.StopInstance(iPlaybackID)
		iPlaybackID = -1
	EndFunction
	
	Event OnInit()
		TargetReference.Disable()
	EndEvent
EndState

State On
	Event OnBeginState(String asOldState)
		TargetReference.Enable()
		playSound() ; after the enable call so that playing the sound is sure to have a reference to use
		handlePlaybackSound()
		setLabel()
		AutoOff && StartTimer(AutoOffSeconds, AutoOffTimerID)
	EndEvent
	
	Function toggle(ObjectReference akActionRef)
		GoToState("Off")
	EndFunction
	
	Sound Function getSound()
		return OnSound
	EndFunction
	
	Message Function getLabel()
		return OnLabel
	EndFunction
	
	Event OnTimer(Int timerID)
		AutoOffTimerID == timerID && GoToState("Off")
	EndEvent
	
	Function handlePlaybackSound()
		if (!PlaybackSound)
			return
		endif
		
		iPlaybackID = PlaybackSound.Play(TargetReference)
	EndFunction
EndState
