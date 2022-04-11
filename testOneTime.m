clc;clear;
global job shuttle_info numOfShuttle job_fix numofjob;
numofjob = 100;
numOfShuttle = 5;
addpath dijktra;
addpath dispatching;
addpath functions;
addpath helper;
addpath(genpath('dijktra'));
addpath(genpath('dispatching'));
addpath(genpath('functions'));
addpath(genpath('helper'));
run('testOneTime_var.m');

pause(1);

%Dispatching---------------------------------------------------------------------%


%Setting-------------------------------------------------------------------------%
step = 0;
job = job_fix;
shuttle_info = zeros(numOfShuttle,8);
for num=1:numOfShuttle
    shuttle_info(num,1)=num;
    shuttle_info(num,2)=1;
    shuttle_info(num,3)=num;
end

%Draw start----------------------------------------------------------------------%
% drawMap(shuttle_info);
% printShutle(shuttle_info);
HABOR();
while 1
    
    if getAllDoneJob(job)
        break;    end
    ReRouting();
    for i=1:numOfShuttle
        controlOneShuttle(i);
    end
    %Draw start----------------------------------------------------------------------%
    % drawMap(shuttle_info);
    % printShutle(shuttle_info);
    step = step+1;
    % pause(0.1);
end
result = step;
totalOfShuttle = 0;
for num=1:numOfShuttle
    totalOfShuttle = totalOfShuttle+ shuttle_info(num,8);
end
fprintf('End\n');
fprintf("Step %d\n", step);
fprintf("totalOfShuttle %d\n", totalOfShuttle);