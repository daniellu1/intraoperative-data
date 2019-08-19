%%Returns the first timestep where the heartbeat has reached "equilibrium"
function [sortedMaxima sortedHighestPeaks difference] = findEquilibrium(maxima, topPercentile)

    sortedMaxima = sortrows(maxima,[2,1]);
    [r,c] = size(sortedMaxima);
    
    highestPeaks = sortedMaxima(int64(topPercentile * r):r, 1:2); 
    sortedHighestPeaks = sortrows(highestPeaks,[1,2]);
    [r,c] = size(sortedHighestPeaks); 
    
    difference = zeros(r,1); 
    for i = 2:r
        difference(i,1) = sortedHighestPeaks(i,1) - sortedHighestPeaks(i-1,1); 
    end
    
end