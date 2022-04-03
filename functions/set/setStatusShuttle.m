function setStatusShuttle(shuttleID, status)
global shuttle_info;
switch status
    case 'idle'
        stt = 1;
    case 'retrieved'
        stt = 2;
    case 'delivery'
        stt = 3;
    otherwise
        stt = 4;
end
shuttle_info(shuttleID,2) = stt;
end