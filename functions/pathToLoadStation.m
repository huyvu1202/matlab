function [e, path] = pathToLoadStation(shuttleID, loadStation)
global layout;
    crPos = getCurrentPos(shuttleID);
    nextPos = loadStation;
    [e, path] = dijkstra(layout,crPos,nextPos);
end