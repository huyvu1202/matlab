clc;clear;
addpath dijktra;
addpath dispatching;
addpath functions;
addpath helper;
addpath(genpath('dijktra'));
addpath(genpath('dispatching'));
addpath(genpath('functions'));
addpath(genpath('helper'));
run('testOneTime_var.m');
global job shuttle_info numOfShuttle job_fix;
pause(1);

%Dispatching---------------------------------------------------------------------%


%Setting-------------------------------------------------------------------------%
numofjob = 20;
numOfShuttle = 5;

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
result = step;
totalOfShuttle = 0;
for num=1:numOfShuttle
    totalOfShuttle = totalOfShuttle+ shuttle_info(num,8);
end
fprintf('End\n');
fprintf("Step %d\n", step);
fprintf("totalOfShuttle %d\n", totalOfShuttle);