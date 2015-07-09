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
