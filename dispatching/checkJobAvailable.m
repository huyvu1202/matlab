function checkJobAvailable()
global job;
for i=1:size(job,1)
    if checkJobDone(i) == false
        callShullteToLoad(i);
    end
end
end