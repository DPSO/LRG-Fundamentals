/*
	LRG MISSION TEMPLATE
	LR_fnc_ConfigZeus.sqf
	Author: MitchJC
	Description: Used to configure a Zeus Module. Ensures that any AI placed down by that Zeus have Dynamic Sim enabled and their difficulty settings configured to the LRG Default. 
	
	Syntax
	[_object] call LR_fnc_ConfigZeus;
	
	Parameters
	_object - Zeus Module to apply the function to.  <OBJECT>
	
	Example 1:	[this] call LR_fnc_ConfigZeus;

	
*/
params [
"_object"
];

_object addEventHandler [
	"CuratorObjectPlaced", {
		params ["_curator", "_entity"];
	
		_class = typeOf (_entity);
		_result  = call {
			if (_class isKindOf "Man") exitWith {
			
				private _Group = call {
					if ((typeName _entity) isEqualTo "GROUP") exitWith { _entity };
					if ((typeName _entity) isEqualTo "OBJECT") exitWith { group _entity };
					_entity;
				};

				[_Group, "LRG Default"] remoteExec ["LR_fnc_SetUnitSkill",2];
				[_Group, true] remoteExec ["enableDynamicSimulation",2];
			};
			
			if (_class isKindOf "AllVehicles") exitWith {
				{
					[_x, "LRG Default"] remoteExec ["LR_fnc_SetUnitSkill",2];
				} forEach crew _entity;
				[group _entity , true] remoteExec ["enableDynamicSimulation",2];	
			};					
		};	
	}
];

_object setVariable ["showNotification", false];
_object setVariable ["birdType", "", true];
	
