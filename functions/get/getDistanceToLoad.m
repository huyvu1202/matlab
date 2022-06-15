function [dis]=getDistanceToLoad(shuttleID)
dis = 0;
job_id = getAssignedJobOnShuttle(shuttleID);

job_pos = getLoadingPos(job_id); 
current_pos = getCurrentPos(shuttleID);

dis = getDistanceAtoB(current_pos, job_pos);

end