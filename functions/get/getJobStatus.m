function [stt] = getJobStatus(jobID)
global job;
stt = job(jobID,5);
end