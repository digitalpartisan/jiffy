Scriptname Jiffy:BackgroundProcessor extends Quest
{This quest should be running before process() is called, though steps have been taken to hedge against the failure case where this expectation is not met.}

Jiffy:List:Queue Property MyQueue Auto Const Mandatory

String sStateDormant = "Dormant" Const
String sStateWaiting = "Waiting" Const
String sStateWorking = "Working" Const
String sStateStopped = "Stopped" Const

Bool Function isDormant()
	return false
EndFunction

Function goToDormant()
	GoToState(sStateDormant)
EndFunction

Bool Function isWaiting()
	return false
EndFunction

Function goToWaiting()
	GoToState(sStateWaiting)
EndFunction

Bool Function isWorking()
	return false
EndFunction

Function goToWorking()
	GoToState(sStateWorking)
EndFunction

Bool Function isStopped()
	return false
EndFunction

Function goToStopped()
	GoToState(sStateStopped)
EndFunction

Jiffy:List:Queue Function getQueue()
	return MyQueue
EndFunction

Function queueItem(Var item)
	Jiffy:BackgroundProcessor:Logger.logReceivedItem(self, item)
	getQueue().add(item)
EndFunction

Event OnQuestShutdown()
	goToStopped()
EndEvent

Function process(Var item)

EndFunction

Function processLogic(Var item)
{Override this to implement the actual behavior of the processor.}
	Jiffy:BackgroundProcessor:Logger.logNoProcessingLogic(self)
EndFunction

Auto State Dormant
	Event OnQuestInit()
		goToWaiting()
	EndEvent
EndState

State Waiting
	Event OnBeginState(String asOldState)
		getQueue().peek() && goToWorking()
	EndEvent

	Function process(Var item)
		queueItem(item)
		goToWorking()
	EndFunction
EndState

State Working
	Event OnBeginState(String asOldState)
		Var item = getQueue().poll()
		item && processLogic(item)
		goToWaiting()
	EndEvent

	Function process(Var item)
		queueItem(item)
	EndFunction
EndState

State Stopped
	Event OnBeginState(String asOldState)
		getQueue().clear()
	EndEvent
EndState