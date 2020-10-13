ScriptName Jiffy:Canary extends Quest Hidden
{Extend this script to give it a unique full name as needed so that the right script name is used when call() is invoked.}

String Property FullScriptName Auto Const Mandatory
{Put the full name of the script this item is attached to here.}
Int Property iSaveFileMonitor Auto Hidden
{Do not mess with ever - this is used by Canary to track data loss}

Function callAPI(Quest callingQuest, String asScriptName) Global
    if (!callingQuest || !Game.IsPluginInstalled("CanarySaveFileMonitor.esl") || !asScriptName || "" == asScriptName)
    	return
    endif

    Var[] kArgs = new Var[0]
    kArgs.Add(callingQuest)
    kArgs.Add(asScriptName)
    
    Jiffy:Logger.logCanaryCall(callingQuest, asScriptName)
    Utility.CallGlobalFunction("Canary:API", "MonitorForDataLoss", kArgs)
EndFunction

String Function getScriptName()
	return FullScriptName
EndFunction

Function call()
	callAPI(self, getScriptName())
EndFunction

Event OnQuestInit()
    call()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
    call()
EndEvent
