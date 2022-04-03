function [pos]= getAssignedJobOnShuttle(shuttleID)
global shuttle_info;
pos = shuttle_info(shuttleID, 6);
end