function setJobDone(ShuttleID)
global job shuttle_info;
jobID = shuttle_info(ShuttleID, 6);
job(jobID,4) = 1;
% fprintf('Done job: %d\n',jobID );
end