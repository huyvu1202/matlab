close all; clear all; path(pathdef); clc;
addpath dijktra;
addpath dispatching;
addpath functions;
addpath helper;
addpath(genpath('dijktra'));
addpath(genpath('dispatching'));
addpath(genpath('functions'));
addpath(genpath('helper'));
global job shuttle_info numOfShuttle job_fix numofjob;
loop = 10;
tt_result = [];
tt_totalOfShuttle = [];
for i=1:loop    
    numofjob = 100;
    run('testOneTime_var.m');
    
    %Dispatching---------------------------------------------------------------------%   
    %Setting-------------------------------------------------------------------------%
    totalCase = 15;
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
            shuttle_info(num,4)=num;
        end
%         drawMap(shuttle_info);
        HABOR();
        pause(1);
        while 1
%             drawMap(shuttle_info);
            %Draw start----------------------------------------------------------------------%
            if getAllDoneJob(job)
                break;    end
            for ctrol=1:numOfShuttle
                controlOneShuttle(ctrol);
            end
            ReRouting();
            step = step+1;
        end
        result(numOfShuttle)= step;
        for num=1:numOfShuttle
            totalOfShuttle(numOfShuttle) = totalOfShuttle(numOfShuttle)+ shuttle_info(num,8);
        end
    end
    tt_result = [tt_result;result];
    tt_totalOfShuttle = [tt_totalOfShuttle; totalOfShuttle];
end
fprintf('End');
figure;
plot(t,tt_result',t, tt_totalOfShuttle');
xlabel('Number of Shuttle');
ylabel('Total Step');
grid on;