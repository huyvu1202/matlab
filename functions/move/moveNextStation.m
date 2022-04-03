function moveNextStation(shuttleID, nextPos)
global layout shuttle_info station;
curPos = getCurrentPos(shuttleID);
if curPos == nextPos
    %fprintf("Stop Shutte: %d\n",shuttleID);
    
elseif layout(curPos, nextPos)== 0
    %fprintf("Can't move: Shutte %d from %d to %d\n",shuttleID, curPos,nextPos );
    
elseif station(nextPos,6) ~= 0
    %fprintf("Pos Blocked: Shutte %d from %d to %d\n",shuttleID, curPos,nextPos );
    shuttle_info(shuttleID, 7) = 1;
    
else
    shuttle_info(shuttleID,3) = nextPos;
    shuttle_info(shuttleID, 7) = 0;
    shuttle_info(shuttleID, 8) = shuttle_info(shuttleID, 8) + 1;
    %fprintf("Moved Shutte: %d from %d to %d\n",shuttleID, curPos,nextPos );
    
end
syncData;
end