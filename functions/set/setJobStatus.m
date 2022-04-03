function setJobStatus(jobID,status)
global job;
job(jobID,5) = status;
end