function [done] = getDoneJob(job)
for i=1:size(job,1)
    if job(i,4) ~= 1
        done = false;
        return
    end
end
done = true;
fprintf("All Job completed\n");
end