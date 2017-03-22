asd_copy3den = {
    params ["_control","_DIK"];
    if !(_DIK in [46,47,48]) exitWith {};

    _attribute = switch (_DIK) do {
        case (46): {"startPosBlu[] = {%1, %2};"};
        case (47): {"startPosOpf[] = {%1, %2};"};
        case (48): {"startPosInd[] = {%1, %2};"};
    };

    _pos = screenToWorld getMousePosition;
    _strPos = format [_attribute,round (_pos select 0),round (_pos select 1)];
    copyToClipBoard _strPos;
};
(findDisplay 313) displayAddEventHandler ["KeyDown","_this call asd_copy3den"];
