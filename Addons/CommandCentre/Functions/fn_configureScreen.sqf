disableSerialization;

params ["_object", "_selection"];

systemChat str _object;
systemChat str _selection;

missionNamespace setVariable ["LRG_CC_currentScreenObject", _object];
missionNamespace setVariable ["LRG_CC_currentScreenSelection", _selection];

if !(createDialog "ScreenConfigDialog") exitWith {systemChat "Couldn't create dialog!"};

private _display = findDisplay 21822;

// set up button event handlers
(_display displayCtrl 2400) ctrlSetEventHandler ["ButtonClick", "[] call LR_fnc_viewHelmetCam"];
(_display displayCtrl 2401) ctrlSetEventHandler ["ButtonClick", "[0] call LR_fnc_viewDroneCam"];
(_display displayCtrl 2402) ctrlSetEventHandler ["ButtonClick", "[] call LR_fnc_viewSatImage"];
(_display displayCtrl 2403) ctrlSetEventHandler ["ButtonClick", "[1] call LR_fnc_viewDroneCam"];
(_display displayCtrl 1101) ctrlSetEventHandler ["ButtonClick", "closeDialog 2;"];

// set title
private _screenMode = _object getVariable [format ["LRG_CC_screen_%1_mode", _selection], ""];
private _screenTarget = _object getVariable [format ["LRG_CC_screen_%1_target", _selection], ""];
private "_modeName";

if ((!(_screenMode isEqualTo "")) && (!(_screenTarget isEqualTo ""))) then {
	switch (_screenMode) do {
		case "HCAM": { _modeName = "Viewing Helmet Cam"; };
		case "DCAM": { _modeName = "Viewing Drone Cam"; };
		case "SAT": { _modeName = "Viewing Satellite Footage"; };
		default { _modeName = "Error, invalid mode!"; };
	};

	ctrlSetText [1000, format["Configure Screen - %1: %2", _modeName, _screenTarget]];
};

// populate the list boxes
// helmet cams
call cTab_fnc_updateLists;

_hCamList = _display displayCtrl 2100;

lbClear _hCamList;
_hCamList lbSetCurSel -1;
{
	_index = _hCamList lbAdd format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
	_hCamList lbSetData [_index, str _x];
} forEach cTabHcamlist;
lbSort [_hCamList, "ASC"];
_hCamList lbSetCurSel 0;

// drone cams
_dCamList = _display displayCtrl 2101;

lbClear _dCamList;
_dCamList lbSetCurSel -1;
{
	_index = _dCamList lbAdd format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,getText (configfile >> "cfgVehicles" >> typeOf _x >> "displayname")];
	_dCamList lbSetData [_index, str _x];
} forEach cTabUAVList;
lbSort [_dCamList, "ASC"];
_dCamList lbSetCurSel 0;

// sat view
_satList = _display displayCtrl 2102;

lbClear _satList;
_satList lbSetCurSel -1;
{
	_index = _satList lbAdd format ["%1:%2 (%3)", groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
	_satList lbSetData [_index, str _x];
} forEach allPlayers;
lbSort [_satList, "ASC"];
_satList lbSetCurSel 0;