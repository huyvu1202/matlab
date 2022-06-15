function handleDeadlock()
%loop bao gom station_id
global loop station timeLoad shuttle_info;
listShuttleOnPath = [];
for i=1:size(loop,1)
    for node = 1:size(loop{i},2)
        if station(node,6) ~= 0
            listShuttleOnPath = [listShuttleOnPath station(node,6)];
        end
    end
end
for s=1:size(listShuttleOnPath,2)
    for id=1:size(listShuttleOnPath,2)
        behind_shuttle_id = listShuttleOnPath(id);
        if strcmp(getStatusShuttle(behind_shuttle_id),'retrieved')
            job_behind_shuttle_id = getAssignedJobOnShuttle(behind_shuttle_id);
            job_behind_pos = getLoadingPos(job_behind_shuttle_id);
            if (getJobStatus(job_behind_shuttle_id) ~= 0)
                continue;
            end
            front_shuttle_id_list = [];
            for next_id = id:size(listShuttleOnPath,2)
                front_shuttle_id_list = [front_shuttle_id_list listShuttleOnPath(next_id)];
            end
            for next_id = 1:id-1
                front_shuttle_id_list = [front_shuttle_id_list listShuttleOnPath(next_id)];
            end
            front_shuttle_id_list(1) = [];
            if (size(front_shuttle_id_list,1) == 0)
                continue;
            end
            for front_shuttle_index = 1:size(front_shuttle_id_list,2)
                
                front_shuttle_id = front_shuttle_id_list(front_shuttle_index);
                job_behind_shuttle_id = getAssignedJobOnShuttle(behind_shuttle_id);
                job_behind_pos = getLoadingPos(job_behind_shuttle_id);
                if strcmp(getStatusShuttle(front_shuttle_id),'retrieved')
                    job_front_shuttle_id = getAssignedJobOnShuttle(front_shuttle_id);
                    job_front_pos = getLoadingPos(job_front_shuttle_id);
                    if (getJobStatus(job_front_shuttle_id) ~= 0)
                        continue;
                    end
                    % 1 neu khoang cach 2 xe < thoi gian pickup* van toc
                    behind_pos = getCurrentPos(behind_shuttle_id);
                    front_pos = getCurrentPos(front_shuttle_id);
                    
                    distance_2_shuttle = getDistanceAtoB(behind_pos, front_pos);
                    
                    if distance_2_shuttle >= timeLoad
                        continue;
                    end
                    
                    % 2 neu x toi load = y t?i load + khoang cach 2 load
                    
                    
                    
                    distance_2_job = getDistanceAtoB(job_front_pos, job_behind_pos);
                    
                    if getDistanceToLoad(behind_shuttle_id) ~= distance_2_job + getDistanceToLoad(front_shuttle_id)
                        continue;
                    end
                    
                    % neu cac xe o giua la idle va delivery co target nam ngoai
                    
                    % swap
                    setJobForShuttle(behind_shuttle_id, job_front_shuttle_id);
                    setTargetForShuttle(behind_shuttle_id, job_front_pos);

%                     fprintf("Swap %d -> %d\n", job_front_shuttle_id, behind_shuttle_id);
                    setJobForShuttle(front_shuttle_id, job_behind_shuttle_id);
                    setTargetForShuttle(front_shuttle_id, job_behind_pos);

%                     fprintf("Swap %d -> %d\n", job_behind_shuttle_id, front_shuttle_id);
                end
            end
        end
    end
end
end