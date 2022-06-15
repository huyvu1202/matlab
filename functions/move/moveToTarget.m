function moveToTarget(shuttleID)
global shuttle_info;
target = getTargetPos(shuttleID);
current = getCurrentPos(shuttleID);
if current == target
    %fprintf("shutte %d in target\n", shuttleID);
else
    nextPos = getNextPos(shuttleID);
    moveNextStation(shuttleID, nextPos);
end
end