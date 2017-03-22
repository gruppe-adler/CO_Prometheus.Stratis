_this spawn {
    params ["_win","_playmusic","_completeTasks"];

    #define TERMINATE_DEAD	if ((missionNamespace getVariable ["BIS_fnc_endMission_checkAliveState",true]) && !ismultiplayer && !alive player) exitwith {{_x cuttext ["","plain"]} foreach [_layerNoise,_layerInterlacing,_layerStatic,_layerEnd]};

    _layerNoise = "BIS_fnc_endMission_noise" call bis_fnc_rscLayer;
    _layerInterlacing = "BIS_fnc_endMission_interlacing" call bis_fnc_rscLayer;
    _layerStatic = "BIS_fnc_endMission_static" call bis_fnc_rscLayer;
    _layerEnd = "BIS_fnc_endMission_end" call bis_fnc_rscLayer;

    if (_playmusic) then {
        _musicvolume = musicvolume;
        0.2 fademusic 0;
        sleep 0.2;
        _musicList = if (isnull curatorcamera) then {["EventTrack02_F_Curator","EventTrack01_F_Curator"]} else {["EventTrack02_F_Curator","EventTrack03_F_Curator"]};
        playmusic (_musicList select _win);
        0 fademusic _musicvolume;
        sleep 0.4;
    };

    _layerStatic cutrsc ["RscStatic","plain"];

    sleep 0.3;
    TERMINATE_DEAD

    showhud false;
    _layerEnd cutrsc ["RscMissionEnd","plain"];
    RscNoise_color = [1,1,1,0];

    sleep 5;
    TERMINATE_DEAD

    _layerStatic cutrsc ["RscStatic","plain"];
    sleep 0.5;
    TERMINATE_DEAD

    _layerNoise cutRsc ["prometheus_Default","plain"];
    _layerInterlacing cutRsc ["prometheus_Default","plain"];
    _layerStatic cutRsc ["prometheus_Default","plain"];
    _layerEnd cutRsc ["prometheus_Default","plain"];

    if (_completeTasks) then {
        {
            if (tolower taskstate _x in ["created","assigned"]) then {_x settaskstate "canceled";};
        } foreach simpletasks player;
    };
};
