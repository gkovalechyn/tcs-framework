/**
	Description:
		Initializes everything else that is needed for anyone that is logged in as an admin or has zeus
		access for the current mission.

	Parameters:
		None

	Returns:
		None
*/

//getAssignedCuratorLogic and getAssignedCuratorUnit do not work properly on mission time 0
//and the mission time doesn't increase on the briefing screen, so we need to wait for the time
//to increase and then make sure we have a curator logic assigned to include the admin briefing
private _start = time;
private _isAdmin = false;

while {(time - _start) < 10} do {
	if (!isNull (getAssignedCuratorLogic player)) exitWith {
		_isAdmin = true;
	};
	sleep 1;
};

if (!_isAdmin) exitWith {};

if (!serverCommandAvailable "#kick") then {
	// In this case we are not an admin but have access to zeus. We have to create the admin briefing
	// since it only gets created to who has access to server commands.
	[] call TCS_fnc_briefing_admin;
};


// Setup the server FPS debug marker
TCS_var_serverFPSMarker = createMarkerLocal ["TCS_mrk_serverFPSMarker", [0, -500]];

["TCS_evt_serverFPSUpdate", {
	params ["_fps", "_localUnitCount", "_localGroupCount"];
	private _markerType = "mil_circle";
	private _markerColor = "ColorGreen";

	if (_fps < 30) then {
		_markerType = "mil_warning";
		_markerColor = "ColorYellow";
	};

	if (_fps < 15) then {
		_markerColor = "ColorRed";
	};

	TCS_var_serverFPSMarker setMarkerColorLocal _markerColor;
	TCS_var_serverFPSMarker setMarkerTypeLocal _markerType;
	TCS_var_serverFPSMarker setMarkerText format ["FPS: %1, %2 local groups, %3 local units", _fps, _localGroupCount, _localUnitCount];
}] call CBA_fnc_addEventHandler;
