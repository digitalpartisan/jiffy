Scriptname JiffyTesting:MessageContainer extends Jiffy:ValueMap

Message Property JiffyTesting_MessageContainer_Message Auto Const Mandatory

String sTokenTestMessage = "TestMessage" Const

JiffyTesting:MessageContainer Function getInstance() Global
	return Game.GetFormFromFile(0x00003691, "JiffyTesting.esp") as JiffyTesting:MessageContainer
EndFunction

Bool Function setTestMessage(Message testMessage)
	return set(sTokenTestMessage, testMessage)
EndFunction

Message Function getTestMessage()
	return get(sTokenTestMessage) as Message
EndFunction

Function initialize()
	setTestMessage(JiffyTesting_MessageContainer_Message)
EndFunction
