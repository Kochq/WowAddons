
WeakAurasSaved = {
["dynamicIconCache"] = {
},
["editor_tab_spaces"] = 4,
["displays"] = {
["5 Second Rule & Mana Ticks"] = {
["controlledChildren"] = {
"Bar",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tKwhPGqCa",
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://wago.io/tKwhPGqCa/1",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 79,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "5 Second Rule timer and mana ticks that should not get messed up by potions and other mana sources.\n\nIf some ticks are missing increase tolerance in options.",
["version"] = 1,
["subRegions"] = {
},
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["scale"] = 1,
["border"] = false,
["anchorFrameFrame"] = "PlayerFrameManaBar",
["regionType"] = "group",
["borderSize"] = 2,
["borderInset"] = 1,
["selfPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.0.0",
["tocversion"] = 11505,
["id"] = "5 Second Rule & Mana Ticks",
["alpha"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["authorOptions"] = {
},
["uid"] = "(DpdwDI5iUL",
["borderEdge"] = "Square Full White",
["config"] = {
},
["conditions"] = {
},
["information"] = {
},
["groupIcon"] = "136222",
},
["Energy Tick Bar"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["yOffset"] = -2,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://wago.io/L1eTpdV2Q/4",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["fontFlags"] = "OUTLINE",
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "CENTER",
["barColor"] = {
0.89411764705882,
0.83921568627451,
0,
0,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["multi"] = {
},
},
["ingroup"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 4,
["multi"] = {
true,
true,
nil,
true,
},
},
["faction"] = {
["multi"] = {
},
},
["use_class"] = false,
["pvptalent"] = {
["multi"] = {
},
},
["race"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["sparkDesaturate"] = false,
["texture"] = "Blizzard Raid Bar",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["auto"] = true,
["tocversion"] = 20501,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["displayIcon"] = 133949,
["sparkOffsetX"] = 0,
["wagoID"] = "L1eTpdV2Q",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["use_form"] = false,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["form"] = {
["multi"] = {
true,
true,
true,
},
},
["event"] = "Stance/Form/Aura",
["unevent"] = "auto",
["spellIds"] = {
},
["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and t and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t == aura_env.id and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            local id = aura_env.id\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", id) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend\n\n\n\n",
["names"] = {
},
["check"] = "event",
["use_inverse"] = false,
["unit"] = "player",
["custom_type"] = "stateupdate",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["duration"] = "1",
["use_showCost"] = false,
["use_unit"] = true,
["powertype"] = 3,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unevent"] = "auto",
["event"] = "Power",
["use_percentpower"] = true,
["use_requirePowerType"] = true,
["unit"] = "player",
["use_power"] = false,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["percentpower"] = {
"100",
},
["percentpower_operator"] = {
"~=",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Conditions",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["use_alive"] = true,
["use_resting"] = false,
["use_mounted"] = false,
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 79,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["border_color"] = {
},
["type"] = "subforeground",
},
},
["height"] = 6,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
0,
0,
0,
0.5,
},
["preferToUpdate"] = false,
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["zoom"] = 0,
["icon"] = false,
["anchorFrameFrame"] = "PlayerFrameManaBar",
["useTooltip"] = false,
["borderInFront"] = false,
["backgroundColor"] = {
0,
0,
0,
0,
},
["icon_side"] = "RIGHT",
["customTextUpdate"] = "event",
["useAdjustededMax"] = false,
["sparkHeight"] = 16,
["width"] = 116,
["xOffset"] = 0,
["customText"] = "",
["semver"] = "1.0.3",
["sparkHidden"] = "NEVER",
["id"] = "Energy Tick Bar",
["borderBackdrop"] = "ElvUI Blank",
["frameStrata"] = 4,
["anchorFrameType"] = "SELECTFRAME",
["spark"] = true,
["config"] = {
},
["inverse"] = true,
["sparkDesature"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "RchfpVR72j6",
},
["Thorns"] = {
["iconSource"] = -1,
["wagoID"] = "O_T8mUayI",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 10.99999809265137,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://wago.io/O_T8mUayI/2",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["group_countOperator"] = "<",
["useName"] = true,
["type"] = "aura2",
["auranames"] = {
"Arcane Intellect",
},
["useGroup_count"] = true,
["unit"] = "group",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["ignoreDisconnected"] = true,
["ignoreDead"] = true,
["spellIds"] = {
},
["names"] = {
},
["group_count"] = "100%",
["subeventSuffix"] = "_CAST_START",
["ignoreInvisible"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"Arcane Intellect",
},
["unit"] = "player",
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 79,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["version"] = 2,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glowLength"] = 10,
["glow"] = false,
["glowScale"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 19.99999618530273,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 102,
["multi"] = {
[103] = true,
[104] = true,
[102] = true,
[105] = true,
},
},
["use_exact_spellknown"] = true,
["use_class"] = true,
["use_spellknown"] = true,
["use_class_and_spec"] = false,
["use_spec"] = true,
["use_vehicleUi"] = false,
["use_alive"] = true,
["spellknown"] = 168,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["adjustedMax"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["xOffset"] = 30.99999351501464,
["cooldown"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["useTooltip"] = false,
["selfPoint"] = "CENTER",
["authorOptions"] = {
},
["config"] = {
},
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.1",
["tocversion"] = 110002,
["id"] = "Thorns",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 19.99998703002927,
["keepAspectRatio"] = false,
["uid"] = "qdyofs(WXLg",
["inverse"] = false,
["parent"] = "buffs",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.glow",
},
},
},
},
["information"] = {
["forceEvents"] = true,
},
["cooldownEdge"] = false,
},
["buffs"] = {
["backdropColor"] = {
1,
1,
1,
0.5,
},
["controlledChildren"] = {
"Mark of the Wild",
"Thorns",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["borderEdge"] = "Square Full White",
["border"] = false,
["yOffset"] = -215.1229248046875,
["anchorPoint"] = "CENTER",
["borderSize"] = 2,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["borderColor"] = {
0,
0,
0,
1,
},
["scale"] = 1,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
},
["regionType"] = "group",
["internalVersion"] = 79,
["xOffset"] = -211.9627075195313,
["selfPoint"] = "CENTER",
["id"] = "buffs",
["borderOffset"] = 4,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["borderInset"] = 1,
["uid"] = "u7RXbTt6DVu",
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["subRegions"] = {
},
["alpha"] = 1,
["conditions"] = {
},
["information"] = {
},
["config"] = {
},
},
["Mark of the Wild"] = {
["iconSource"] = -1,
["wagoID"] = "O_T8mUayI",
["xOffset"] = 10.734375,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 11.03777465820312,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://wago.io/O_T8mUayI/2",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["ignoreDead"] = true,
["useName"] = true,
["auranames"] = {
"Frost Armor",
},
["useGroup_count"] = true,
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["ignoreDisconnected"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["unit"] = "group",
["group_count"] = "100%",
["subeventSuffix"] = "_CAST_START",
["ignoreInvisible"] = true,
["group_countOperator"] = "<",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"Frost Armor",
},
["debuffType"] = "HELPFUL",
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 79,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 2,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["border_size"] = 1,
["type"] = "subborder",
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 1,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glowScale"] = 1,
["glow"] = false,
["glowLength"] = 10,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 20,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["single"] = 102,
["multi"] = {
[103] = true,
[104] = true,
[102] = true,
[105] = true,
},
},
["talent"] = {
["multi"] = {
},
},
["use_never"] = false,
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_alive"] = true,
["use_class"] = true,
["use_spellknown"] = true,
["use_spec"] = true,
["use_vehicleUi"] = false,
["use_class_and_spec"] = false,
["use_exact_spellknown"] = true,
["spellknown"] = 168,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 20,
["source"] = "import",
["alpha"] = 1,
["cooldownEdge"] = false,
["useTooltip"] = false,
["information"] = {
["forceEvents"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["color"] = {
1,
1,
1,
1,
},
["parent"] = "buffs",
["uid"] = "B)fFpRDKLMU",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.1",
["tocversion"] = 110002,
["id"] = "Mark of the Wild",
["authorOptions"] = {
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["preferToUpdate"] = false,
["config"] = {
},
["inverse"] = false,
["keepAspectRatio"] = false,
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.glow",
},
},
},
},
["cooldown"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["Bar"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://wago.io/tKwhPGqCa/1",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "CENTER",
["barColor"] = {
0,
0.23529411764706,
1,
0,
},
["desc"] = "5 Second Rule timer and mana ticks that should not get messed up by potions and other mana sources.\n\nIf some ticks are missing increase tolerance in options.",
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = false,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["HUNTER"] = true,
["WARLOCK"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["zoneIds"] = "",
},
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "ElvUI Blank",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["auto"] = true,
["tocversion"] = 11505,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkOffsetX"] = 0,
["wagoID"] = "tKwhPGqCa",
["parent"] = "5 Second Rule & Mana Ticks",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "2",
["subeventPrefix"] = "SPELL",
["custom_hide"] = "timed",
["debuffType"] = "HELPFUL",
["unit"] = "player",
["type"] = "custom",
["use_unit"] = true,
["custom_type"] = "stateupdate",
["dynamicDuration"] = true,
["custom"] = "function(allstates, event ,target, guid, spellID)\n    local time = GetTime()\n    local FSR_DURATION = 5\n    \n    local spellCost = GetSpellPowerCost(spellID)     \n    if spellCost == nil or not next(spellCost) then\n        return false\n    end\n    \n    allstates[\"\"] = {\n        show = true,\n        changed = true,\n        duration = FSR_DURATION,\n        expirationTime = time + FSR_DURATION,\n        progressType = \"timed\",\n        autoHide = true\n    }\n    \n    aura_env.nextTick = time + FSR_DURATION - aura_env.config.TOLERANCE\n    return true\nend",
["event"] = "Health",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
["subeventSuffix"] = "_ENERGIZE",
["spellIds"] = {
},
["use_sourceUnit"] = true,
["check"] = "event",
["unevent"] = "auto",
["sourceUnit"] = "player",
["customVariables"] = "\n",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["events"] = "UNIT_POWER_UPDATE:player",
["custom_type"] = "stateupdate",
["check"] = "event",
["debuffType"] = "HELPFUL",
["custom"] = "function(allstates, event, target, type)\n    local time = GetTime()\n    local MANA_TICK_RATE = 2\n    local currentMana = UnitPower(\"player\" , Enum.PowerType.Mana)\n    local maxMana =  UnitPowerMax(\"player\", Enum.PowerType.Mana)\n    \n    if currentMana >= maxMana then\n        return false\n    end\n    \n    if  time >= aura_env.nextTick then\n        allstates[\"\"] = {\n            show = true,\n            changed = true,\n            duration = MANA_TICK_RATE,\n            expirationTime = time + MANA_TICK_RATE,\n            progressType = \"timed\",\n            autoHide = true,\n            inverse = true\n        }\n        aura_env.nextTick = time + MANA_TICK_RATE - aura_env.config.TOLERANCE\n        return true\n    else\n        return false\n    end\nend",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 79,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 15,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Accidental Presidency",
["text_anchorYOffset"] = -10,
["text_shadowYOffset"] = -1,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "None",
["text_anchorPoint"] = "SPARK",
["text_visible"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 1,
},
{
["border_size"] = 16,
["border_anchor"] = "bar",
["type"] = "subborder",
["border_color"] = {
1,
1,
1,
0.5,
},
["border_visible"] = false,
["border_edge"] = "None",
["border_offset"] = 5,
},
},
["height"] = 1,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["authorOptions"] = {
{
["type"] = "number",
["useDesc"] = true,
["max"] = 1,
["step"] = 0.01,
["width"] = 1,
["min"] = 0,
["key"] = "TOLERANCE",
["default"] = 0.1,
["name"] = "Timing Tolerance",
["desc"] = "Allowed deviation from expected timing",
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["anchorFrameFrame"] = "PlayerFrameManaBar",
["spark"] = true,
["borderInFront"] = true,
["uid"] = "dvZawXAyrxC",
["icon_side"] = "RIGHT",
["borderBackdrop"] = "Blizzard Tooltip",
["useAdjustededMax"] = false,
["sparkHeight"] = 20,
["desaturate"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
["custom"] = "WeakAuras.ScanEvents(\"TICKUPDATE\", true)",
["do_custom"] = false,
},
["init"] = {
["custom"] = "aura_env.nextTick = GetTime()",
["do_custom"] = true,
},
},
["anchorFrameType"] = "SCREEN",
["semver"] = "1.0.0",
["sparkHidden"] = "NEVER",
["id"] = "Bar",
["backgroundColor"] = {
0,
0.22352941176471,
1,
0,
},
["frameStrata"] = 1,
["width"] = 110.00001525879,
["zoom"] = 0,
["color"] = {
},
["inverse"] = false,
["config"] = {
["TOLERANCE"] = 0.1,
},
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = false,
},
["preferToUpdate"] = false,
},
},
["lastUpgrade"] = 1734655437,
["lastArchiveClear"] = 1734140686,
["minimap"] = {
["minimapPos"] = 12.80663178318119,
["hide"] = false,
},
["historyCutoff"] = 730,
["dbVersion"] = 79,
["migrationCutoff"] = 730,
["features"] = {
},
["login_squelch_time"] = 10,
["registered"] = {
},
["editor_font_size"] = 12,
}
