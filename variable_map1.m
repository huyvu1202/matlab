%-------------------------------------------------------------------------%
clear;
clc;
global layout A x y color job_fix shuttle_info station numOfShuttle pathOfShuttle name numofjob;
global timeUnload timeLoad timeSwitcher;
timeUnload = 0;
timeLoad = 0;
timeSwitcher = 5;



station = [
    %1  2   3   4       5       6
    %id x   y   type    link    shuttleon
    1	1	4	0	    0	    0;
    2	2	4	1	    1	    0;
    3	3	4	0	    0	    0;
    4	4	4	0	    0	    0;
    5	5	4	0	    0	    0;
    6	6	4	0	    0	    0;
    7	7	3	0	    0	    0;
    8	7	2	0	    0	    0;
    9	7	1	1	    2	    0;
    10	6	0	0	    0	    0;
    11	5	0	0	    0	    0;
    12	4	0	0	    0	    0;
    13	3	0	0	    0	    0;
    14	2	0	1	    3	    0;
    15	1	0	0	    0	    0;
    16	0	1	0	    0	    0;
    17	0	2	0	    0	    0;
    18	0	3	0	    0	    0;
    19	2	4	1	    1	    0;
    20	7	1	1	    2	    0;
    21	2	0	1	    3	    0;];

layout = [
    0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
    0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
    0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
    0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0;
    0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0;
    0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0;
    0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0;
    0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0;
    0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0;
    0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0;
    0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0;
    0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0;
    0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0;
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0;
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0;
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0;
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1;
    1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    ];

numOfNode = size(layout,1);

A = digraph(layout);
x = 10*station(1:18,2)';
y = 10*station(1:18,3)';

%       idle , Retrieved , delivery , other
color = ["cyan", "yellow", "red" , "black" ];
name = ["v1", "v2","v3","v4","v5"];
%-------------------------------------------------------------------------%

% jobid _loadstation _target _stt                   stt_2
%                            0: not push            0: on station
%                            1: done 2:pushed       1: delivery
job_fix = zeros(numofjob,5);
for i=1:numofjob
    job_fix(i,1)=i;
    job_fix(i,2) = randi([1 numOfNode]);
    job_fix(i,3) = randi([1 numOfNode]);
    if (job_fix(i,3) == job_fix(i,2))
        job_fix(i,3) = job_fix(i,2);
        if job_fix(i,3) == numOfNode
            job_fix(i,3) = randi([5 numOfNode-1]);
        end
    end
end

%stt %status %cur_pos %tar_get %wait_time %current_job %block?

%1: idle
%2: notFree
% shuttle_info = [
%     1 1 1 0 0 0 0;
%     2 1 2 0 0 0 0;
%     3 1 3 0 0 0 0;
%     4 1 4 0 0 0 0;
%     5 1 5 0 0 0 0;
%     6 1 6 0 0 0 0;
%     7 1 7 0 0 0 0;
%     8 1 8 0 0 0 0;
%     9 1 9 0 0 0 0;
%     10 1 10 0 0 0 0;
% %     11 1 11 0 0 0 0;
% %     12 1 12 0 0 0 0;
%     ];
% numOfShuttle = size(shuttle_info,1);


%-------------------------------------------------------------------------%
pathOfShuttle={};





%-------------------------------------------------------------------------%





%-------------------------------------------------------------------------%