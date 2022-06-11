%-------------------------------------------------------------------------%
global layout A x y color job_fix shuttle_info station numOfShuttle pathOfShuttle name numofjob job loop;
global timeUnload timeLoad timeSwitcher;
timeUnload = 10;
timeLoad = 10;
timeSwitcher = 10;



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

loop=cell(1);
loop1 = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18];
loop{1}=loop1;
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
    0	0   0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0;
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
name = ["v1", "v2","v3","v4","v5","v6","v7","v8","v9","v10","v11"];
%-------------------------------------------------------------------------%
%1      2            3       4              5
% jobid _loadstation _target _stt           _stt_2
%                            0: notyet      0: waiting
%                            1: done        1: loading
%                                           2: delivery

job_fix = [1,10,13,0,0;
            2,9,15,0,0;
            3,8,18,0,0;
%             4,1,16,0,0;
            ];
numofjob = size(job_fix,1);
job = job_fix;
%1  2       3           4       5           6           7           8
%stt %status %cur_pos %tar_get %wait_time %current_job %block?      steprun

%1: idle
%2: Retrieved
%3: delivery
shuttle_info = [
    1 1 1 0 0 0 0 0;
    2 1 2 0 0 0 0 0;
    3 1 3 0 0 0 0 0;
    4 1 4 0 0 0 0 0;
    ];
numOfShuttle = size(shuttle_info,1);
%-------------------------------------------------------------------------%
pathOfShuttle{1} = 0;
