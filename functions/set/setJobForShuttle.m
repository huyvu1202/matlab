function setJobForShuttle(shuttleID, jobID)
global  shuttle_info;

shuttle_info(shuttleID,6) = jobID;
end