function [dis] = getDistanceAtoB(A, B)
global layout;
dis = 0;
dis =  dijkstra(layout, A, B);
end