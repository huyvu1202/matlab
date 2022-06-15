function [num, listJob] = getListJobAvailable()
global numofjob;
listJob = [];
for jobID=1:numofjob
    if checkJobDone(jobID)==false && getJobStatus(jobID) == 0
        listJob = [listJob jobID];
    end
end
num = size(listJob,2);
end