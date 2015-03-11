local myNAME = "merBandAidZouiFixes"
local myDEBUG_COMMANDS = {}


--[==============================[
    Armor Being Repaired Message
    ----------------------------
    http://forums.elderscrollsonline.com/en/discussion/154608/bug-armor-being-repaired-message-ticket-150303-001096

    ----------------------------
    [Seravi] On all of my characters in the upper right of my screen I keep seeing different pieces of their armor is being repaired. It was at 100% when I logged off before the patch and I have not been in combat or done anything to change the armor totals. Checked my armor at it is still at 100%. I don't use any addons, never have.

    ----------------------------
    [EQBallzz] Happening to me as well. No armor damaged. Not at an NPC that could repair armor. Just standing there and it continually cycles through my armor every few minutes telling me that each piece is repaired. 

    ----------------------------
    The game generates EVENT_INVENTORY_SINGLE_SLOT_UPDATE events with INVENTORY_UPDATE_REASON_DURABILITY_CHANGE, without an actual change to item durability. Whenever (newCondition == 100), regardless of the previous condition, this triggers "ItemRepaired" callbacks. STORE_WINDOW_GAMEPAD then issues spurious "item repaired" alerts.

--]==============================]

if STORE_WINDOW_GAMEPAD and STORE_WINDOW_GAMEPAD.RepairMessageBox then
    function STORE_WINDOW_GAMEPAD:RepairMessageBox(...)
        -- don't bother trying to figure out whether the event leading here
        -- was genuine or not -- the alert is worthless either way
        return
    end
end


--[======================================[
    error message upon guild note change
    ------------------------------------
    http://www.esoui.com/forums/showthread.php?t=4384

    [circonian] Oh I was doing it wrong, I was able to reproduce it.
    I was right clicking on my name & clicking "Edit Note" I didn't realize there was a note button to click on.
    If I click on the note button next to my name & do what you said I do get the error.

--]======================================]

-- fix by circonian

ZO_PreHook("ZO_KeyboardGuildRosterRowNote_OnClicked", function(control)
    GUILD_ROSTER_KEYBOARD.noteEditedFunction = GUILD_ROSTER_MANAGER:GetNoteEditedFunction()
end)

ZO_PreHook("ZO_FriendsListRowNote_OnClicked", function(control)
    FRIENDS_LIST.noteEditedFunction = FRIENDS_LIST_MANAGER:GetNoteEditedFunction()
end)
