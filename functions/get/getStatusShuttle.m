function [stt]=getStatusShuttle(shuttleID)
global shuttle_info;
stt = shuttle_info(shuttleID,2);
    switch stt
        case 1
            stt = 'idle';
        case 2
            stt = 'retrieved';
        case 3
            stt = 'delivery';
        otherwise
            stt = 'error';
    end
end