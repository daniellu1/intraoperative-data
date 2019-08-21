%%Returns a matrix holding the local maxima (and their time indexes in the
%%original pulsatile data
function maxima = findMaxima(MeasurementSet)
    arraySize = 0;
    maxima = zeros(300,2);
    data = MeasurementSet.Measurement{1,1}.curves.pulsatileCurve; 
    for i = 2:(size(data)-1)
        if (data(i) > data(i-1) && data(i) > data(i+1))
            maxima(arraySize+1, 1) = i; 
            maxima(arraySize+1, 2) = data(i);  
            arraySize = arraySize + 1; 
        end
    end
    maxima = maxima(1:arraySize, 1:2); 
end
