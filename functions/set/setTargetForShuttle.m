function setTargetForShuttle(shuttleID, target)
global shuttle_info pathOfShuttle;
shuttle_info(shuttleID,4) = target;
[~, L] = pathToLoadStation(shuttleID,target);
pathOfShuttle{shuttleID} = L;
end