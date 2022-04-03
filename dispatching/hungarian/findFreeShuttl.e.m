function [F] = findFreeShuttle()
global shuttle_info numOfShuttle;
F = 0;
for i=1:numOfShuttle
    if shuttle_info(i,2) == 0
        F = [F i];
    end
end
if size(F,2) > 1
    F(1) = [];
end
end