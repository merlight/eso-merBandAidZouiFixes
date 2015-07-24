local myNAME = "merBandAidZouiFixes"


--[====================================================================[
    Make objective capture meter initially transparent.

    Sometimes the game decides that the round thing showing capture
    progress at keep/resource flags needs to fade out, despite the fact
    that it's not actually shown.  But it starts with alpha==1, and I
    suspect it doesn't even have the correct texture assigned at that
    point, hence the briefly appearing white box.  It only happens once
    after login or /reloadui, because all inadvertent fade-outs beyond
    the first one start with alpha==0.

    http://forums.elderscrollsonline.com/en/discussion/139774/little-white-box-or-something-popping-up-on-screen
--]====================================================================]

if ZO_ObjectiveCaptureMeter then
    ZO_ObjectiveCaptureMeter:SetAlpha(0)
end


--[====================================================================[
    Prevent guild scene freezing due to specific custom rank names.

    http://www.esoui.com/forums/showthread.php?t=4867
--]====================================================================]

if GUILD_RANKS and GUILD_RANKS.rankNameEdit then
    local zorg_rankNameEdit_SetText = GUILD_RANKS.rankNameEdit.SetText

    function GUILD_RANKS.rankNameEdit:SetText(name)
        -- disable OnTextChanged handler
        self:SetHandler("OnTextChanged", nil)
        -- initialize the edit field using original SetText
        zorg_rankNameEdit_SetText(self, name)
        -- restore original handler for catching user input
        self:SetHandler("OnTextChanged", ZO_GuildRankNameEdit_OnTextChanged)
    end
end


--[====================================================================[
    Fix tooltips for scrolls and emperor alliance bonuses.

    http://www.esoui.com/forums/showpost.php?p=21926&postcount=72
--]====================================================================]

BONUS_TYPE_HOME_KEEPS = BONUS_TYPE_HOME_KEEPS or 1
BONUS_TYPE_ENEMY_KEEPS = BONUS_TYPE_ENEMY_KEEPS or 2
BONUS_TYPE_DEFENSIVE_SCROLLS = BONUS_TYPE_DEFENSIVE_SCROLLS or 3
BONUS_TYPE_OFFENSIVE_SCROLLS = BONUS_TYPE_OFFENSIVE_SCROLLS or 4
BONUS_TYPE_EMPEROR = BONUS_TYPE_EMPEROR or 5


--[====================================================================[
    Fix map pin locations inside Daggerfall Outlaws Refuge.

    http://i.imgur.com/akJh46V.jpg
--]====================================================================]

local zorg_MapPin_SetLocation = ZO_MapPin.SetLocation

function ZO_MapPin:SetLocation(xLoc, yLoc, radius)
    if GetCurrentMapZoneIndex() == 423 then -- Daggerfall Outlaws Refuge
        xLoc = xLoc * 0.9 + 0.06
        yLoc = yLoc * 0.9 + 0.01
    end
    zorg_MapPin_SetLocation(self, xLoc, yLoc, radius)
end
