function setTargetForShuttle(shuttleID, target)
global shuttle_info;
shuttle_info(shuttleID,4) = target;
[~, L] = pathToLoadStation(shuttleID,target);
setPath(shuttleID, L);
end