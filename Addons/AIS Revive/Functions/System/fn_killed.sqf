﻿/*
 * Author: Psycho
 
 * Clean up the unit if they got killed. Is called by the killed EH.
 
 * Arguments:
	0: Unit (Object)
	1: Killer (Object)
 
 * Return value:
	-
*/

params ["_unit", "_killer"];

if (!(isNull (_unit getVariable ["ais_DragDrop_Torso", objNull]))) then {
	[_unit] call LRG_AIS_System_fnc_release;
};

// Save the respawn loadout in case we need to reestore, this
// is likely to be without any FAKs so, we will restore these
// in the respawn function
if (_unit isEqualTo player) then {
    player setVariable ["AIS_RespawnLoadout", getUnitLoadout player];
};
