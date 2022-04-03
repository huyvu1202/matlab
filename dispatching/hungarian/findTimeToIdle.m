function time = findTimeToIdle(shuttleID)
global timeUnload;
time = 0;
stt = getStatusShuttle(shuttleID);
if stt == 'idle'
    time = 0;
elseif stt == 'retrieved'    
    time = findDistanceToJob(shuttleID, jobID) + findDistanceToEndPoint(shuttleID) + timeUnload;
elseif stt == 'delivery'
    time = findDistanceToEndPoint(shuttleID) + timeUnload;
else
    %fprintf("findTimeToIdle error\n");
end
end