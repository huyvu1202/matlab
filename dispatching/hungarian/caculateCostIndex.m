function [cij] = caculateCostIndex(shuttleID,jobID)
global layout;
w1 = 8;
w2 = 5;
%c_ij = w1*id job + w2*d_ij

if jobID ~= -1 && shuttleID ~= -1
    id = getJobPriority(jobID);
    shuttlePos = getCurrentPos(shuttleID);
    jobPos = getLoadingPos(jobID);
    d_ij = dijkstra(layout, shuttlePos, jobPos);
else
    id = 1000;
    d_ij = 10000;
end
cij = w1*(id) + w2*d_ij;
end