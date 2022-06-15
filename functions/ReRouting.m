function ReRouting()
global shuttle_info job numOfShuttle station numOfNode

for i = 1:numOfShuttle
    if shuttle_info(i,7) == 1
        curPos = getCurrentPos(i);
        nextPos= getNextPos(i);
        
        shuttle_id_block = station(nextPos,6);
        
        if shuttle_id_block~=0 && strcmp(getStatusShuttle(shuttle_id_block),'idle')
            
            A = getCurrentPos(i);
            B = getCurrentPos(shuttle_id_block);
            C = getTargetPos(i);
            if B == C
                newtarget = getTargetPos(i) + 1;
                if newtarget > 58
                    newtarget = 1;
                end
                setTargetForShuttle(shuttle_id_block, newtarget);
            else
                [~, path_block ] = pathToLoadStation(shuttle_id_block, C);
                
                tranh_block = [4 5 59; 12 13 63; 20 21 67; 33 34 69; 41 42 65; 49 50 61];
                danhsachdiemthoat = [];
                for bl = 1:size(tranh_block,1)
                    if find(path_block == tranh_block(bl,1))
                        danhsachdiemthoat = [danhsachdiemthoat bl];
                    end
                end
                num = size(danhsachdiemthoat,1);
                if (num ~=0)
                    dis = zeros(1,num);
                    for z = 1:size(danhsachdiemthoat)
                        [e, ~] = pathToLoadStation(shuttle_id_block,tranh_block(danhsachdiemthoat(z),1));
                        dis(i) = e;
                    end
                    [~,I] = min(dis);
                    diemthoat = danhsachdiemthoat(I);
                    diem1 = tranh_block(diemthoat,2);
                    diem2 = tranh_block(diemthoat,3);
                    
                    if find(path_block==diem1)
                        %                         fprintf("abc");
                        setTargetForShuttle(shuttle_id_block, diem2);
                    else
                        %                         fprintf("def");
                        setTargetForShuttle(shuttle_id_block, diem1);
                    end
                else
                    newtarget = getTargetPos(i) + 1;
                    if newtarget > 58
                        newtarget = 1;
                    end
                    setTargetForShuttle(shuttle_id_block, newtarget);
                end
                
            end
            
        end
    end
end
end