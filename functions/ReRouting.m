function ReRouting()
global shuttle_info job numOfShuttle station numOfNode

for i = 1:numOfShuttle
    if shuttle_info(i,7) == 1
        curPos = getCurrentPos(i);
        nextPos= getNextPos(i);

        shuttle_id_block = station(nextPos,6);
        
        if shuttle_id_block~=0 && strcmp(getStatusShuttle(shuttle_id_block),'idle') 
            newtarget = getTargetPos(i) + 1;
            if newtarget > numOfNode 
                newtarget = 1;
            end
            setTargetForShuttle(shuttle_id_block, newtarget);
        end
    end
end


end