function syncData()
global shuttle_info station numOfShuttle;

station(:,6) = 0;
for i=1:numOfShuttle
    station(shuttle_info(i,3),6) = shuttle_info(i,1);
end
end