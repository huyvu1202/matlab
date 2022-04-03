function [crPos] = getCurrentPos(shuttleID)
global shuttle_info;
crPos = shuttle_info(shuttleID, 3);
end