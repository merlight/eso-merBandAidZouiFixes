--[[
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
--]]
