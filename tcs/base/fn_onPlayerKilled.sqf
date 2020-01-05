/**
	Event handler for the onPlayerKilled of the TCS_Respawn respawn template.
*/

cutText ["", "BLACK OUT", 5];
5 fadeSound 0.1;

[] spawn {
	sleep 5;

	//Just in case the player respawned immediately, otherwise he will get stuck in the spectator screen
	if (!alive player) then {
		["Initialize", [player, [], false, TCS_var_spectatorAllowFreeCamera, TCS_var_spectatorAllowThirdPersonCamera]] call BIS_fnc_EGSpectator;	
	};

	cutText ["", "BLACK IN", 1];
	1 fadeSound 1;
};

[] call TCS_fnc_savePlayerRadioSettings;