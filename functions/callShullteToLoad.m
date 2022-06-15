function callShullteToLoad(jobID)
global job;
[num, list] = getListShuttle();
if num ~= 0
    % khoang cach tu shuttle free toi job
    loadStation = getLoadingPos(jobID);
    dis = zeros(1,num);
    for i=1:num
        [e, L] = pathToLoadStation(list(i),loadStation);
        dis(i) = e;
    end
    [M,I] = min(dis);
    shuttleID = list(I);
    %Set vi tri tiep theo cho xe
    setTargetForShuttle(shuttleID, loadStation);
    setJobForShuttle(shuttleID, jobID);
    setStatusShuttle(shuttleID, 'retrieved');
    
    %fprintf("Job %d -> shuttle %d \n",jobID,shuttleID);
else
    %fprintf("no shullte free\n");
end
syncData;
end