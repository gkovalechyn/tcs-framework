#include "..\..\script_macros.hpp"


//FUNC(CombatFlank)

params ["_Group","_currenttarget","_enemydir"];

[_Group] call CBA_fnc_clearWaypoints;
if ((random 2) > 1) then {_group setformation "LINE";} else {_group setformation "WEDGE";};
_group setformdir _enemydir;
SETVAR(_group,Task,"DEFEND");
