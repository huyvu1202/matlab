function controlOneShuttle(shuttleID)
global shuttle_info job timeUnload timeLoad;
stt = getStatusShuttle(shuttleID);
current = getCurrentPos(shuttleID);
target = getTargetPos(shuttleID);

if strcmp(stt, 'idle')
    if (current == target)
        % checkJobAvailable();
        shuttle_info(shuttleID,5) = 0;
    else
        moveToTarget(shuttleID);
    end
elseif strcmp(stt, 'retrieved')
    if current == target
        if(shuttle_info(shuttleID,5) == timeLoad)
            setStatusShuttle(shuttleID, 'delivery');
            job_id = shuttle_info(shuttleID, 6);
            job(job_id,5) = 1;
            
            jobID = getJobOfShuttle(shuttleID);
            setTargetForShuttle(shuttleID, jobID);
            %fprintf("Shuttle %d: job %d loaded \n", shuttleID, jobID);
            shuttle_info(shuttleID,5) = 0;

            %Draft
            shuttle_info(shuttleID, 8) = shuttle_info(shuttleID, 8) + 1;
        else
            shuttle_info(shuttleID,5) = shuttle_info(shuttleID,5) + 1;
            %fprintf("Shuttle %d: loading\n", shuttleID);
        end
    else
        moveToTarget(shuttleID);
    end
elseif strcmp(stt, 'delivery')
    if current == target
        if(shuttle_info(shuttleID,5) == timeUnload)
            %fprintf("Shuttle %d complete job \n", shuttleID);
            setStatusShuttle(shuttleID, 'idle');
            setJobDone(shuttleID);
            shuttle_info(shuttleID,5) = 0;
            % checkJobAvailable();
            %Draft
            shuttle_info(shuttleID, 8) = shuttle_info(shuttleID, 8) + 1;
        else
            shuttle_info(shuttleID,5) = shuttle_info(shuttleID,5) + 1;
            %fprintf("Shuttle %d came to unload station \n", shuttleID);
        end
    else
        moveToTarget(shuttleID);
    end
end



end