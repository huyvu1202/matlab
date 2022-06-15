function [done] = getAllDoneJob(job)
for i=1:size(job,1)
    if ~checkJobDone(i)
        done = false;
        return
    end
end
done = true;
fprintf("All Job completed\n");
end