Scriptname Jiffy:Vault111ExitDetector extends Quest
{This script monitor's the player's progress and either starts a quest of your choosing when your plugin loads or waits for the player to leave Vault 111 for the first time before starting your quest.
To use:
Attach this quest in the editor and check the boxes "Start Game Enabled" and "Run Once" (found on the "Quest Data" page in the quest editor) to make use of its functionality.
Be sure to set the property values by auto-filling for everything but the QuestToStart property which you must manually specify.}

Group OutOfTimeData
	Quest Property MQ102 Auto Const Mandatory
	{The quest "Out of Time"}
	Int Property MQ102RequiredObjective = 1 Auto Const
	{The "Exit the Vault" objective}
	Int Property MQ102StageToWatch = 10 Auto Const
	{The stage which is after the player leaves the vault.}
EndGroup

Quest Property QuestToStart Auto Const Mandatory
{Your plugin's quest.}

Function startWatching()
	Jiffy:Vault111ExitDetector:Logger.logObserving(self)
	RegisterForRemoteEvent(MQ102, "OnStageSet")
EndFunction

Function stopWatching()
	Jiffy:Vault111ExitDetector:Logger.logStopObserving(self)
	UnregisterForRemoteEvent(MQ102, "OnStageSet")
EndFunction

Function startTargetQuest()
	Jiffy:Vault111ExitDetector:Logger.logStartingQuest(self)
	QuestToStart.Start()
	Stop() ; done here.  Once the target quest has started, leaving the exit detector running would just waste resources
EndFunction

Event OnQuestInit()
{Detects the player's progress and responds accordingly.}
	if (MQ102.IsObjectiveCompleted(MQ102RequiredObjective)) ; has the player left Vault 111?  If so, start the quest!
		startTargetQuest()
	else ; If not, setup an event observer so this script finds out when they do
		startWatching()
	endif
EndEvent

Event OnQuestShutdown()
	stopWatching()
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
{If "Out of Time" indicates to the game engine that the player has left Vault 111 for the first time, this script's job is done.  Stop listening and start the quest.}
	Jiffy:Vault111ExitDetector:Logger.logStageEvent(self, akSender, auiStageID)
	if (MQ102 == akSender && MQ102StageToWatch == auiStageID)
		stopWatching()
		startTargetQuest()
	endif
EndEvent
