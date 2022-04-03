function [tar] = getTargetPos(shuttleID)
global shuttle_info;
tar = shuttle_info(shuttleID, 4);
end