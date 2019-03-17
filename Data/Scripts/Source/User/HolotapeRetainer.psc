Scriptname HolotapeRetainer extends Quest
{This script ensures that a specified holotape is a quest item and is therefore never removed from the player's inventory so that your plugin's functionality isn't gimped thereby.
Attach it to a quest in the editor to make use of its functionality.
To use:
Have an existing quest or make one just for this purpose.  Make sure this quest runs perpetually so that the reference to the holotape is never cleared (unless you deliberately want to stop this quest because that will allow the holotape to be dropped.)
Create an alias on the quest named HolotapeAlias (to take advantage of the auto-fill feature on this script's HolotapeAlias property, or give it any other name if you don't care about auto-fill-ability.)
Set this alias to be a specific reference but leave it blank.  Check the "Optional" so that the quest can start and the "Quest Object" box which will make this alias' reference a Quest Item.
Populate this script's properties.
Make sure your plugin knows to start this quest when you deem it appropriate to give the user your plugin's holotape.}

Holotape Property MyHolotape Auto Const Mandatory
{Your plugin's holotape record}
ReferenceAlias Property HolotapeAlias Auto Const Mandatory
{The quest alias pointing to the instance of the holotape this script gives to the player.  See documentation on this script to populate this property.}
Bool Property RemoveOnShutdown = false Auto Const
{Whether or not the holotape should be removed from the player's inventory when this retainer quest is stopped.}
Bool Property RemoveSilently = false Auto Const
{Only takes affect if RemoveOnShutdown is set to true.  If set to true, the player is not informed that the tape has left their inventory.}

Function takeHolotape(Bool bSilent = false)
	Game.GetPlayer().RemoveItem(MyHolotape, -1, bSilent)
EndFunction

Function giveHolotape()
{This behavior exists in its own function so that your plugin may optionally repeat this process without restarting the associated quest.}
	Actor aPlayer = Game.GetPlayer()
	Bool bPlayerHad = (0 < aPlayer.GetItemCount(MyHolotape))
	
	if (bPlayerHad) ; the player already has this tape and presumably knows it, so silently take any they have in order to make sure we know the right instance to point the alias at
		takeHolotape(true)
	endif
	
	ObjectReference akInstance = aPlayer.PlaceAtMe(MyHolotape) ; we're not just adding the MyHolotape record to the player's inventory because we need a handle to the instance we want to retain
	HolotapeAlias.ForceRefTo(akInstance) ; this step is the magic.  An alias designated a quest object turns whatever it points to into a quest item
	
	aPlayer.AddItem(akInstance, 1, bPlayerHad)
EndFunction

Event OnQuestInit()
	giveHolotape()
EndEvent

Event OnQuestShutdown()
{This event runs in parallel with the Alias Script's OnAliasShutdown event, so tape removal is possible at this point.}
	if (RemoveOnShutdown)
		takeHolotape(RemoveSilently)
	endif
EndEvent
