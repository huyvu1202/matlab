function [pos] = getLoadingPos (jobID)
global job;
pos = job(jobID, 2);
end