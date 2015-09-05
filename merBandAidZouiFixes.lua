local myNAME = "merBandAidZouiFixes"
local EM = EVENT_MANAGER
local SV = {}


local function onLoaded(eventCode, addonName)
    if addonName == "ZO_Ingame" then
        EM:UnregisterForEvent(myNAME, eventCode)
        SV = ZO_SavedVars:NewAccountWide("ZO_Ingame_SavedVariables", 17, myNAME, SV)
    end
end

EM:RegisterForEvent(myNAME, EVENT_ADD_ON_LOADED, onLoaded)


--[====================================================================[
    Restore custom UI scale after login or zone change.

    http://forums.elderscrollsonline.com/en/discussion/212138/ui-scaling-resetting
--]====================================================================]


local function onScreenResized(eventCode, x, y, guiName)
    -- this event is triggered by changing the custom scale or screen resolution;
    -- store current custom scale setting in ZO_Ingame_SavedVariables
    SV.UI_SETTING_CUSTOM_SCALE = GetSetting(SETTING_TYPE_UI, UI_SETTING_CUSTOM_SCALE)
end

local function onPlayerActivated(eventCode)
    local currentScale = tonumber(GetSetting(SETTING_TYPE_UI, UI_SETTING_CUSTOM_SCALE))
    local savedScale = tonumber(SV.UI_SETTING_CUSTOM_SCALE)
    if currentScale and savedScale and math.abs(currentScale - savedScale) >= 1e-5 then
        --df("restoring UI scale because diff = %.6f", math.abs(currentScale - savedScale))
        SetSetting(SETTING_TYPE_UI, UI_SETTING_CUSTOM_SCALE, SV.UI_SETTING_CUSTOM_SCALE)
        ApplySettings()
    end
end

EM:RegisterForEvent(myNAME, EVENT_PLAYER_ACTIVATED, onPlayerActivated)
EM:RegisterForEvent(myNAME, EVENT_SCREEN_RESIZED, onScreenResized)
