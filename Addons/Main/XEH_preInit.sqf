// AIS Revive
[
    "LRG_Main_AISRevive",
    "CHECKBOX",
    ["AIS Revive", "Use AIS Revive System - Will not run with @ACE"],
    "LRG Main",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Vehicle Crew List
[
    "LRG_Main_VehicleCrewList",
    "CHECKBOX",
    ["Vehicle Crew List", "Shows a list of players in a vehicle."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["YAINA_fnc_crewNames", 0, true]};
    }
] call CBA_Settings_fnc_init;

// Dynamic Groups
[
    "LRG_Main_DynamicGroups",
    "CHECKBOX",
    ["BIS Dynamic Groups", "Enable Vanilla Dynamic Groups system (U Menu)"],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_DynamicGroups", 0, true]};
    }
] call CBA_Settings_fnc_init;

// YAINA Earplugs
[
    "LRG_Main_Earplugs",
    "CHECKBOX",
    ["YAINA Earplugs", "Enable YAINA Earplugs addactions. Cannot be used with @ACE."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_Earplugs", 0, true]};
    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "LRG_Main_PilotCheck",
    "CHECKBOX",
    ["Pilot Restrictions", "Restrict aircraft so only those with 'Pilot' Trait can fly."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_PilotCheck", 0, true]};
    }
] call CBA_Settings_fnc_init;

// Voyager Compass
[
    "LRG_Main_VoyagerCompass",
    "CHECKBOX",
    ["Voyager Compass HUD", "Enable Voyager Compass HUD. Players can still disable locally."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_VoyagerCompass", 0, true]};
    }
] call CBA_Settings_fnc_init;

// QS Mag Repack
[
    "LRG_Main_QSMagRepack",
    "CHECKBOX",
    ["QS Repack Magazines", "Allows players to repack magazines through an add action. Not used with ACE."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_QSRepackMags", 0, true]};
    }
] call CBA_Settings_fnc_init;

// CH View Distance
[
    "LRG_Main_CHViewDistance",
    "CHECKBOX",
    ["CH View Distance", "Enable CHVD within LRG Fundamentals"],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["CHVD_fnc_init", 0, true]};
    }
] call CBA_Settings_fnc_init;

// CHVD - Max View Distance
[
    "LRG_Main_ViewDistanceMaxDistance",
    "SLIDER",
    ["CHVD - Max View Distance", "Max distance a player can set CHVD View Distance to."],
    "LRG Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Max Object View Distance
[
    "LRG_Main_ViewDistanceMaxObjectDistance",
    "SLIDER",
    ["CHVD - Max Object View Distance", "Max distance a player can set CHVD Object View Distance to."],
    "LRG Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Allow No Grass
[
    "LRG_Main_ViewDistanceNoGrass",
    "CHECKBOX",
    ["CHVD - Allow No Grass", "Should players be allowed to turn grass off?"],
    "LRG Main",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Arsenal - Save/Load
[
    "LRG_Main_ArsenalSaveLoad",
    "CHECKBOX",
    ["Arsenal - Save/Load", "Should a player be allowed to Save/Load Loadouts in the Arsenal?"],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_ArsenalLoadSave", 0, true]};
    }
] call CBA_Settings_fnc_init;

// TFAR - Range Multiplyer
[
    "LRG_Main_TFARTransmitRange",
    "SLIDER",
    ["TFAR - Range Multiplyer", "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis"],
    "LRG Main",
    [0, 5, 2.5, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// TFAR - Terrain Interference
[
    "LRG_Main_TFARTerrainInterference",
    "SLIDER",
    ["TFAR - Terrain Interference", "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact."],
    "LRG Main",
    [0, 5, 1, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Cue Cards
[
    "LRG_Main_CueCards",
    "CHECKBOX",
    ["Cue Cards", "Show/Hide Cue Cards in ACE Self Interaction Menu."],
    "LRG Main",
    true,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_AddCueCards", 0, true]};
    }
] call CBA_Settings_fnc_init;

// Diary Defaults
[
    "LRG_Main_Diary",
    "CHECKBOX",
    ["Diary Defaults", "Show/Hide Default LRG Diary Entries."],
    "LRG Main",
    true,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_Diary", 0, true]};
    }
] call CBA_Settings_fnc_init;

// Creator Actions
[
    "LRG_Main_CreatorActions",
    "CHECKBOX",
    ["Creator Actions", "Show/Hide Creator Actions in ACE Self Interaction Menu"],
    "LRG Main",
    true,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_InitCreatorActions", 0, true]};
    }
] call CBA_Settings_fnc_init;

// Fatigue (Vanilla ONLY)
[
    "LRG_Main_FatigueVanilla",
    "CHECKBOX",
    ["Fatigue (Vanilla ONLY)", "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE."],
    "LRG Main",
    true,
    true,
    {
        if (!isserver) exitwith {};
        remoteExecCall ["LR_fnc_VanillaFatigue", 0, true];
    }
] call CBA_Settings_fnc_init;

// FPS Counter
[
    "LRG_Main_FPSCounter",
    "CHECKBOX",
    ["FPS Counter", "Show FPS counter of Player, Server & Headless Client on the map."],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["YAINA_fnc_showFPS", 0, true]};
    }
] call CBA_Settings_fnc_init;

// LRG Logging
[
    "LRG_Main_Logging",
    "CHECKBOX",
    ["LRG Logging", "Log connected players, their roles and if they go unconcious with ACE. Requires @A3Log"],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
       if (_this) then {remoteExecCall ["LR_fnc_Logs", 0, true]};
    }
] call CBA_Settings_fnc_init;

// LRG_Main_DynamicSim
[
    "LRG_Main_DynamicSim",
    "CHECKBOX",
    ["LRG Dynamic Sim", "Simple check for Dynamic Sim enabled. If not enabled it will enable it to default LRG Values. "],
    "LRG Main",
    false,
    true,
    {
        if (!isserver) exitwith {};
        if (_this) then {remoteExecCall ["LR_fnc_DynamicSim", 0, true]};
    }
] call CBA_Settings_fnc_init;