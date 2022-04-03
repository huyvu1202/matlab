function [cost] = caculateCostMatrix(shuttleID,jobID)
a1= 0.5;
% cost = thoi gian tro nen nhan roi*heso + quang duong di chuyen toi
% thoi gian nhan roi = quang duong con lai* he so + thoi gian unload

%cost = TimeToIdle*a1 + DistanceToStation

TimeToIdle = findTimeToIdle(shuttleID);
DistanceToJob = findDistanceToJob(shuttleID,jobID);

cost = TimeToIdle*a1 + DistanceToJob;
end