function [num, listShuttle] = getListShuttleAvailable()
global numOfShuttle;
listShuttle = [];
for shuttleID=1:numOfShuttle
    if strcmp(getStatusShuttle(shuttleID),'idle')
        listShuttle = [listShuttle shuttleID];
    elseif strcmp(getStatusShuttle(shuttleID),'retrieved') 
        jobID = getAssignedJobOnShuttle(shuttleID);
        if getJobStatus(jobID) == 0
            listShuttle = [listShuttle shuttleID];
        end
    end
end
num = size(listShuttle,2);
end