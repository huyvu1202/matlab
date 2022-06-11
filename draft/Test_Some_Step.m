close all; clear all; path(pathdef); clc;
global job shuttle_info numOfShuttle job_fix numofjob;
addpath dijktra;
addpath dispatching;
addpath functions;
addpath helper;
addpath(genpath('dijktra'));
addpath(genpath('dispatching'));
addpath(genpath('functions'));
addpath(genpath('helper'));
tt_result = [];
tt_totalOfShuttle = [];
run('testOneTime_var_step.m');
syncData();
%Dispatching---------------------------------------------------------------------%
%Setting-------------------------------------------------------------------------%
totalCase = 1;
t=1:totalCase;
result = zeros(1,totalCase);
totalOfShuttle = zeros(1,totalCase);
step = 0;
job = job_fix;
% syncData();
drawMap(shuttle_info);
HABOR();
pause(1);
while 1
    drawMap(shuttle_info);
    %Draw start----------------------------------------------------------------------%
    if getAllDoneJob(job)
        break;    end
    for ctrol=1:numOfShuttle
        controlOneShuttle(ctrol);
    end
    ReRouting();
    step = step+1;
    if step == 50
        a=1;
    end
end
result(numOfShuttle)= step;
grid on;