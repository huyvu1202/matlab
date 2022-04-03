function setJobStatus(jobID,status)
global job;
job(jobID,4) = status;
end