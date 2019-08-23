%% GLOBAL VARIABLES TO CHANGE
clear; clc; close all; 
load('../Equilibrium Data/ecgSummary', 'ecgSummary');

%% RETRIEVE DATA AND STORE IN GLOBAL VARIABLES
LIMA = []; 
SVG = []; 
RA = [];
RIMA = []; 
LAD = []; 

%% Loop through ecgSummary and calculate DF

for i = 1:size(ecgSummary,1)
    
    % Get variables from ecgSummary and format MAT file name
    caseNum = cell2mat(ecgSummary(i,1)); 
    name = cell2mat(ecgSummary(i,2));
    fileName = '../Equilibrium Data/Case0'; 
    if (caseNum < 10)
        fileName = strcat(fileName, '0', int2str(caseNum), '/'); 
    elseif(caseNum < 100)
        fileName = strcat(fileName, int2str(caseNum), '/'); 
    end
    fileName = strcat(fileName, name, '_flow_raw'); 
    
    % CALCULATE FOR LIMA 
    try

        load(fileName, 'flowData');
        Q_systole = 0; 
        Q_diastole = 0;
        for k = 5:12
            for j = cell2mat(ecgSummary(i,k)):cell2mat(ecgSummary(i,k+1))
                if (flowData(j) < 0)
                    if (mod(k,2) == 1) 
                        Q_systole = Q_systole - flowData(j);
                    else
                        Q_diastole = Q_diastole - flowData(j);
                    end
                else
                    if (mod(k,2) == 1) 
                        Q_systole = Q_systole + flowData(j);
                    else
                        Q_diastole = Q_diastole + flowData(j);
                    end 
                end
            end
        end
        df = Q_diastole / (Q_diastole + Q_systole) * 100; 
        if (strcmpi(name, 'LIMA') || strcmpi(name, 'LIMA2'))
            LIMA = [LIMA; df];
        elseif (strcmpi(name, 'SVG') || strcmpi(name, 'SVG2'))
            SVG = [SVG; df];
        elseif (strcmpi(name, 'RA') || strcmpi(name, 'RA2'))
            RA = [RA; df]; 
        elseif (strcmpi(name, 'RIMA') || strcmpi(name, 'RIMA2'))
            RIMA = [RIMA; df]; 
        elseif (strcmpi(name, 'LAD') || strcmpi(name, 'LAD2'))
            LAD = [LAD; df];
        end

     catch
        saveEquilibriumData = 0; 
     end
    
end

%% PLOT DATA

grid on; 
hold on; 
xlim([0,6]); 
xticks([1 2 3 4 5]); 
xticklabels({'LIMA', 'SVG', 'RA', 'RIMA', 'LAD'}); 

%Plot Raw Values
LIMA_num = ones([size(LIMA,1),1]); 
scatter(LIMA_num, LIMA, 'r');

SVG_num = 2.*(ones([size(SVG,1),1]));
scatter(SVG_num, SVG, 'r'); 

RA_num = 3.*(ones([size(RA,1),1]));
scatter(RA_num, RA, 'r'); 

RIMA_num = 4.*(ones([size(RIMA,1),1]));
scatter(RIMA_num, RIMA, 'r'); 

LAD_num = 5.*(ones([size(LAD,1),1]));
scatter(LAD_num, LAD, 'r'); 

%Plot Statistical Values
x_axis_average = [1,2,3,4,5]; 
y_axis_average = [mean(LIMA), mean(SVG), mean(RA), mean(RIMA), mean(LAD)]; 
y_axis_median = [median(LIMA), median(SVG), median(RA), median(RIMA), median(LAD)]; 
standard_dev = [std(LIMA), std(SVG), std(RA), std(RIMA), std(LAD)]; 
p = plot(x_axis_average, y_axis_median, '.b'); 
e = errorbar(x_axis_average, y_axis_average, standard_dev, '.k'); 
title('% Diastolic Filling vs. Vessel Type');
lgd = legend([e,p], {'mean/standard deviation', 'median'}); 
ylabel('% Diastolic Filling'); 
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