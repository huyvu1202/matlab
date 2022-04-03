function [jobId]= getJobOfShuttle(shuttleID)
global job shuttle_info;
jobId = job(shuttle_info(shuttleID,6),3);
end