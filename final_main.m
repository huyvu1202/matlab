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
loop_step = 1;
tt_result = [];
tt_totalOfShuttle = [];
for i=1:loop_step
    run('final_setup_var.m');
    syncData();
    %Dispatching---------------------------------------------------------------------%
    %Setting-------------------------------------------------------------------------%
    to_totalCase = 12;
    from_case = 1;
    t=1:to_totalCase;
    result = zeros(1,to_totalCase);
    totalOfShuttle = zeros(1,to_totalCase);
    for numOfShuttle=from_case:to_totalCase
        step = 0;
        job = job_fix;
        shuttle_info = zeros(numOfShuttle,8);
        station_list=[2 5 8 10 12 14 16 18 26 31 39 47 55 56 57 58 1];
        for num=1:numOfShuttle
            shuttle_info(num,1)=num;
            shuttle_info(num,2)=1;
            shuttle_info(num,3)=station_list(num);
            shuttle_info(num,4)=num;
        end
        syncData();
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
            ReRouting(); % Tranh di chuyen
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
p = plot(t,tt_result',t, tt_totalOfShuttle');
p(1).LineWidth = 2;
p(2).LineWidth = 2;
legend('Total Time','Total distance')
xlabel('Number of Shuttle');
ylabel('Step');
xlim([1 to_totalCase]);
grid on;