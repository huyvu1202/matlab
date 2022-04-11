function drawMap(shuttle)
global layout A x y name color numOfShuttle job;

plot(A,'XData',x,'YData',y,'LineWidth',2,'EdgeColor','k');

axis equal;
hold on;
W=2;
H=2;
for i=1:numOfShuttle
    j = shuttle(i,3);
    job_id = shuttle(i, 6);
    if j <= size(layout,1)
        rectangle('Position',[x(j)-W/2,y(j)-H/2,W,H],'FaceColor',color(shuttle(i,2))); % Draw shuttle
        text(x(j),y(j)+2,name(i)); % Draw text  
    end
    if job_id ~=0 && job(job_id,5)==1 && job(i,4) ~= 1
        rectangle('Position',[x(j),y(j),1,1],'Curvature',[1 1],'FaceColor','black');
    end
end
for i=1:size(job,1)
    if job(i,4) ~= 1 && job(i,5) ==0
        if job(i,5) == 0
            j = job(i,2);
            rectangle('Position',[x(j)+0.5,y(j)+0.5,1,1],'Curvature',[1 1],'FaceColor','magenta')
        end
    end
end

L = line(ones(3), ones(3));
set(L(1), 'Color', color(1))
set(L(2), 'Color', color(2))
set(L(3), 'Color', color(3))
legend(L, {'Idle','Retrieved','Delivery'})
set(L(:), 'LineWidth', 5)
drawnow, hold off;
pause(0.5);
end