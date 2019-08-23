%% GLOBAL VARIABLES TO CHANGE
clear; clc; close all; 
totalCases = 26;
outlierThreshold = 10; 

%% RETRIEVE DATA AND STORE IN GLOBAL VARIABLES
PIV = []; 
LIMA = []; 
SVG = []; 
RA = [];
RIMA = []; 
LAD = []; 
 
for caseNum = 1:totalCases 
    %% Format File Name
    fileName = '../Equilibrium Data/Case0'; 

    if (caseNum < 10)
        fileName = strcat(fileName, '0', int2str(caseNum), '/'); 
    elseif(caseNum < 100)
        fileName = strcat(fileName, int2str(caseNum), '/'); 
    end
    
    %% Open the LIMA file, if possible
    %  Retrieve equilibrium % backward flow and store it
    
    try 
        load(strcat(fileName,'LIMA'), 'saveEquilibriumData'); 
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            LIMA = [LIMA; bf]; 
        elseif ((100 - bf) < outlierThreshold)
            LIMA = [LIMA; (100-bf)]; 
        end
    catch
        saveEquilibriumData = 0;  
    end
    
    try 
        load(strcat(fileName,'LIMA2'), 'saveEquilibriumData');      
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            LIMA = [LIMA; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            LIMA = [LIMA; (100-bf)];
        end
    catch
        saveEquilibriumData = 0;  
    end  
    
    %% Open the SVG file, if possible
    %  Retrieve equilibrium average value and store it
    
    try 
        load(strcat(fileName,'SVG'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            SVG = [SVG; bf];
            elseif ((100 - bf) < outlierThreshold)
            SVG = [SVG; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end
    
    try 
        load(strcat(fileName,'SVG2'), 'saveEquilibriumData');   
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            SVG = [SVG; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            SVG = [SVG; (100-bf)];
        end
    catch
        saveEquilibriumData = 0;  
    end  
    
    %% Open the PIV file, if possible
    %  Retrieve equilibrium average value and store it
    
    try 
        load(strcat(fileName,'PIV'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            PIV = [PIV; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            PIV = [PIV; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end
    
    try 
        load(strcat(fileName,'PIV2'), 'saveEquilibriumData');   
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            PIV = [PIV; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            PIV = [PIV; (100-bf)];
        end
    catch
        saveEquilibriumData = 0;   
    end   
    
    %% Open the RA file, if possible
    %  Retrieve equilibrium average value and store it
    
    try 
        load(strcat(fileName,'RA'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            RA = [RA; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            RA = [RA; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end
    
    try 
        load(strcat(fileName,'RA2'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            RA = [RA; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            RA = [RA; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end  
    
    %% Open the RIMA file, if possible
    %  Retrieve equilibrium average value and store it
    
    try 
        load(strcat(fileName,'RIMA'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            RIMA = [RIMA; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            RIMA = [RIMA; (100-bf)];
        end
    catch
        saveEquilibriumData = 0;  
    end
    
    try 
        load(strcat(fileName,'RIMA2'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            RIMA = [RIMA; bf]; 
            elseif ((100 - bf) < outlierThreshold)
            RIMA = [RIMA; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end  
    
    %% Open the LAD file, if possible
    %  Retrieve equilibrium average value and store it
    
    try 
        load(strcat(fileName,'LAD'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            LAD = [LAD; bf];
            elseif ((100 - bf) < outlierThreshold)
            LAD = [LAD; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end
    
    try 
        load(strcat(fileName,'LAD2'), 'saveEquilibriumData');  
        totalFlow = 0; 
        backwardFlow = 0; 
        for i = 1:size(saveEquilibriumData,1)
            if (saveEquilibriumData(i,2) < 0)
                totalFlow = totalFlow - saveEquilibriumData(i,2); 
                backwardFlow = backwardFlow - saveEquilibriumData(i,2); 
            else
                totalFlow = totalFlow + saveEquilibriumData(i,2); 
            end
        end
        bf = 100 * backwardFlow / totalFlow; 
        if (bf < outlierThreshold)
            LIMA = [LAD; bf];
            elseif ((100 - bf) < outlierThreshold)
            LAD = [LAD; (100-bf)];
        end
    catch
        saveEquilibriumData = 0; 
    end  
    

end

%% PLOT DATA

grid on; 
hold on; 
xlim([0,7]); 
xticks([1 2 3 4 5 6]); 
xticklabels({'LIMA', 'SVG', 'PIV', 'RA', 'RIMA', 'LAD'}); 

%Plot Raw Values
LIMA_num = ones([size(LIMA,1),1]); 
scatter(LIMA_num, LIMA, 'r');

SVG_num = 2.*(ones([size(SVG,1),1]));
scatter(SVG_num, SVG, 'r'); 

PIV_num = 3.*(ones([size(PIV,1),1]));
scatter(PIV_num, PIV, 'r'); 

RA_num = 4.*(ones([size(RA,1),1]));
scatter(RA_num, RA, 'r'); 

RIMA_num = 5.*(ones([size(RIMA,1),1]));
scatter(RIMA_num, RIMA, 'r'); 

LAD_num = 6.*(ones([size(LAD,1),1]));
scatter(LAD_num, LAD, 'r'); 

%Plot Statistical Values
x_axis_average = [1,2,3,4,5,6]; 
y_axis_average = [mean(LIMA), mean(SVG), mean(PIV), mean(RA), mean(RIMA), mean(LAD)]; 
y_axis_median = [median(LIMA), median(SVG), median(PIV), median(RA), median(RIMA), median(LAD)]; 
standard_dev = [std(LIMA), std(SVG), std(PIV), std(RA), std(RIMA), std(LAD)]; 
p = plot(x_axis_average, y_axis_median, '.b'); 
e = errorbar(x_axis_average, y_axis_average, standard_dev, '.k'); 
ylabel('% Backwards Flow'); 
title('% Backwards Flow Rate vs. Vessel Type');
lgd = legend([e,p], {'mean/standard deviation', 'median'}); 
lgd.Location = 'southoutside'; 
lgd2.Location = 'southoutside'; 
e.LineStyle = 'none'; 
e.Marker = 'square'; 
e.MarkerFaceColor = 'black'; 
e.MarkerEdgeColor = 'black'; 
e.CapSize = 10; 
p.LineStyle = 'none'; 
p.Marker = 'diamond'; 
p.MarkerFaceColor = 'blue'; 
p.MarkerEdgeColor = 'blue'; 
%p.CapSize = 10; 