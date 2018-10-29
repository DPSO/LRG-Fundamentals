class RscStandardDisplay;
class RscText;
class RscPicture;
class RscPictureKeepAspect;
class RscActivePicture;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscEdit;
class RscEditMulti;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscButton;
class RscButtonMenuSteam;
class RscMapControl;
class RscVignette;
class RscInterlacingScreen;
class RscLadderPicture;
class VScrollbar;
class HScrollbar;
class DefaultFont
{
	font = "RobotoCondensed";
};


class RscDisplayCueCard
{
	idd = 20305;
	enableSimulation = 1;
	closeOnMissionEnd = 0;
	scriptName = "RscDisplayCueCard";
	scriptPath = "LRGDisplays";
	onLoad = "[""onLoad"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	movingEnable = true;

	class Controls
	{
		class Picture: RscPictureKeepAspect
		{
			idc = 1001;
			text = "#(argb,8,8,3)color(1,0,0,0.2)";
			x = "safezoneX + 5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneW * 0.13";
			h = "safezoneH * 0.26";
			moving = 1;
			onMouseMoving = "\
				params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
				\
				if !(uinamespace getVariable [""1001_dragged"", false]) exitWith {}; \
				\
				(ctrlPosition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
				\
				_control ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				_control ctrlCommit 2; \
			";
			onMouseButtonDown = "uinamespace setVariable [""1001_dragged"", true];";
			onMouseButtonUp	= "uinamespace setVariable [""1001_dragged"", false];";
		};

		class NotePad: RscEdit
        {
            idc = 1002;
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.093 * safezoneH + safezoneY;
            w = 0.31 * safezoneW;
            h = 0.754 * safezoneH;
            //multiline:
            text = "";
            style = 16;
            lineSpacing = 1;
            colorText[] =   {       0,  0,      0,      1   };
            sizeEx = 0.05;
			onMouseMoving= "\
				params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
				if !(uinamespace getVariable [""1002_dragged"", false]) exitWith {}; \
				\
				(ctrlPosition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
				\
				_control ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				_control ctrlCommit 2; \
				\
				_ctrl = (findDisplay 20305) displayCtrl 1200; \
				_ctrl ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				_ctrl ctrlCommit 2; \
			";
			onMouseButtonDown = "uinamespace setVariable [""1002_dragged"", true];";
			onMouseButtonUp	= "uinamespace setVariable [""1002_dragged"", false];";
        };
    };

	class controlsBackground
	{
        class NotePadBackground: RscPicture
        {
            idc = 1200;
            text = "LRG Fundamentals\Media\images\Cue Cards\notepad_CA.paa";
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.093 * safezoneH + safezoneY;
            w = 0.31 * safezoneW;
            h = 0.754 * safezoneH;
			moving = 1;
        };
    };
};