function HABOR()
[numShuttle, listShuttle] = getListShuttleAvailable();
[numJob, listJob] = getListJobAvailable();
if numJob == 0 || numShuttle == 0
    return
end

% reset status
for sh=1:numShuttle
    shutle_ID = listShuttle(sh);
    setStatusShuttle(shutle_ID, 'idle');
    current = getCurrentPos(shutle_ID);
    setTargetForShuttle(shutle_ID, current);
    setJobForShuttle(shutle_ID , 0);
end

if numJob >= numShuttle
    % For dummy
    % -----------------------------
    for dump = numShuttle+1:numJob
        listShuttle(dump) = -1;
    end
    numShuttle_dump = numJob;
    %------------------------------
    costMat = zeros(numShuttle_dump,numShuttle_dump);
    for jo=1:numJob
        for sh=1:numShuttle_dump
            costMat(jo,sh)= caculateCostIndex(listShuttle(sh),listJob(jo));
        end
    end
    %
    [assignment,~] = Hungarian(costMat);
    for i=1:numJob
        shutle_ID = listShuttle(assignment(i));
        job_ID = listJob((i));
        if shutle_ID == -1 || job_ID == -1
            continue;
        end
        setJobForShuttle(shutle_ID , job_ID);
        %         fprintf("job %d -> shuttle %d\n", job_ID,shutle_ID);
        setStatusShuttle(shutle_ID, 'retrieved');
        loadStation = getLoadingPos(job_ID);
        setTargetForShuttle(shutle_ID, loadStation);
    end
else
    % -----------------------------
    for dump = numJob+1:numShuttle
        listJob(dump) = -1;
    end
    numJob_dump = numShuttle;
    %------------------------------
    costMat = zeros(numShuttle,numShuttle);
    for jo=1:numJob_dump
        for sh=1:numShuttle
            costMat(jo,sh)= caculateCostIndex(listShuttle(sh),listJob(jo));
        end
    end
    [assignment,~] = Hungarian(costMat);
    for i=1:numShuttle
        shutle_ID = listShuttle(assignment(i));
        job_ID = listJob((i));
        if shutle_ID == -1 || job_ID == -1
            continue;
        end
        setJobForShuttle(shutle_ID , job_ID);
%         fprintf("job %d -> shuttle %d\n", job_ID,shutle_ID);
        setStatusShuttle(shutle_ID, 'retrieved');
        loadStation = getLoadingPos(job_ID);
        setTargetForShuttle(shutle_ID, loadStation);
    end
end
handleDeadlock();
end