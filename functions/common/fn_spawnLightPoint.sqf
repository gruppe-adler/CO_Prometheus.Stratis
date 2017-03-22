params ["_pos","_color","_brightness","_ambient",["_attachToObj",objNull],["_attachToOffset",[0,0,0]]];

_light0 = "#lightpoint" createVehicle (_pos);
_light0 setLightColor _color;
_light0 setLightBrightness _brightness;
_light0 setLightAmbient _ambient;

if (!isNull _attachToObj) then {
    _light0 lightAttachObject [_attachToObj, _attachToOffset];
};
