function [done] = checkJobDone(jobID)
    global job;
    done = true;
    if job(jobID,4) == 0
        done = false;
    end
end