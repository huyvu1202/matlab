function [next] = getNextPos(shuttleID)
path = getPath(shuttleID);
if path ~= 0
    step = 0;
    for step=1:size(path,2)
        if path(1,step) == getCurrentPos(shuttleID)
            break;
        end
    end
    step = step+1;
    if step < size(path,2)
        next = path(1,step);
    else
        next = path(1,end);
    end
else
    curPos = getCurrentPos(shuttleID);
    next = curPos;
    %fprintf("path null\n");
end
end