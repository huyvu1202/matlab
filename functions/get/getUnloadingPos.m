function [pos]= getUnloadingPos(jobID)
global job;
pos = job(jobID,3);
end