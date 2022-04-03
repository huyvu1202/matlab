function [size, list] = getListShuttle()
global shuttle_info numOfShuttle;
size = 0;
list = 0;
for shuttleID=1:numOfShuttle
    if strcmp(getStatusShuttle(shuttleID),'idle')
        list = [list shuttleID];
        size = size +1;
    end
end

if size == 0
else
    list(1) = [];
end
end