function checkJobAvailable()
global job;
for i=1:size(job,1)
    if job(i,4) == 0
        callShullteToLoad(i);
    end
end
end