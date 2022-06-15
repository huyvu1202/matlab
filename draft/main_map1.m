clc;clear;
addpath dijktra;
addpath dispatching;
addpath functions;
addpath helper;
addpath(genpath('dijktra'));
addpath(genpath('dispatching'));
addpath(genpath('functions'));
addpath(genpath('helper'));
run('variable_map1.m');
global job shuttle_info numOfShuttle job_fix numofjob;
pause(1);

%Dispatching---------------------------------------------------------------------%


%Setting-------------------------------------------------------------------------%
numofjob = 100;
totalCase = 10;
t=1:totalCase;
result = zeros(1,totalCase);
totalOfShuttle = zeros(1,totalCase);
for numOfShuttle=1:totalCase
    step = 0;
    job = job_fix;
    shuttle_info = zeros(numOfShuttle,8);
    for num=1:numOfShuttle
        shuttle_info(num,1)=num;
        shuttle_info(num,2)=1;
        shuttle_info(num,3)=num;
    end
    while 1
        %Draw start----------------------------------------------------------------------%
        %     drawMap(shuttle_info);
        %     printShutle(shuttle_info);
        if getAllDoneJob(job)
            break;    end
        checkJobAvailable();
        ReRouting();
        for i=1:numOfShuttle
            controlOneShuttle(i);
        end
        step = step+1;
        %     pause(0.5);
    end
    result(numOfShuttle)= step;
    for num=1:numOfShuttle
        totalOfShuttle(numOfShuttle) = totalOfShuttle(numOfShuttle)+ shuttle_info(num,8);
    end
end
fprintf('End');
figure;
plot(t,result,t, totalOfShuttle);
xlabel('Number of Shuttle');
ylabel('Total Step');
grid on;