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
