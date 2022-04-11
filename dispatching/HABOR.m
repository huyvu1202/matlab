function HABOR()
[numShuttle, listShuttle] = getListShuttleAvailable();
[numJob, listJob] = getListJobAvailable();
if numJob == 0 || numShuttle == 0
    return
end
if numJob >= numShuttle
    listJob = listJob(1:numShuttle);
    numJob = numShuttle;
    costMat = zeros(numShuttle,numShuttle);
    for jo=1:numJob
        for sh=1:numShuttle
            costMat(jo,sh)= caculateCostIndex(listShuttle(sh),listJob(jo));
        end
    end
    [assignment,~] = Hungarian(costMat);
    for i=1:numJob
        shutle_ID = listShuttle(assignment(i));
        job_ID = listJob(i);

        setJobForShuttle(shutle_ID , job_ID);
%         fprintf("job %d for shuttle %d\n", job_ID,shutle_ID);
        setStatusShuttle(listShuttle(i), 'retrieved');
        loadStation = getLoadingPos(job_ID);
        setTargetForShuttle(shutle_ID, loadStation);
    end
else
    listShuttle = listShuttle(1:numJob);
    numShuttle = numJob;
    costMat = zeros(numShuttle,numShuttle);
    for jo=1:numJob
        for sh=1:numShuttle
            costMat(jo,sh)= caculateCostIndex(listShuttle(sh),listJob(jo));
        end
    end
    [assignment,~] = Hungarian(costMat);
    for i=1:numJob
        shutle_ID = listShuttle(assignment(i));
        job_ID = listJob(i);
        setJobForShuttle(shutle_ID , job_ID);
%         fprintf("job %d for shuttle %d\n", job_ID,shutle_ID);
        setStatusShuttle(listShuttle(i), 'retrieved');
        loadStation = getLoadingPos(job_ID);
        setTargetForShuttle(shutle_ID, loadStation);
    end
end
end