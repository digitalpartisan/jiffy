Scriptname Jiffy:Vault111ExitDetector:Trigger extends ObjectReference

Quest Property MQ102 Auto Const Mandatory
{autofill}
Int Property Stage = 10 Auto Const

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() != akActionRef)
		return
	endif
	
	(!MQ102.IsStarting() && !MQ102.IsRunning()) && MQ102.Start()
	!MQ102.IsStageDone(Stage) && MQ102.SetStage(Stage)
	
	BlockActivation(true, true)
EndEvent
