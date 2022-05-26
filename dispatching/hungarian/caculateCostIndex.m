function [cij] = caculateCostIndex(shuttleID,jobID)
global layout;
w1 = 1;
w2 = 10;
%c_ij = w1*id job + w2*d_ij

if jobID ~= -1
id = getJobPriority(jobID);
shuttlePos = getCurrentPos(shuttleID);
jobPos = getLoadingPos(jobID);
d_ij = dijkstra(layout, shuttlePos, jobPos);
else
    id = 10;
    d_ij = 10000;
end
cij = w1*(id) + w2*d_ij;
end