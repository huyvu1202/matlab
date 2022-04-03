function [pri] = getJobPriority(jobID)
global job;
pri = job(jobID,1);
end