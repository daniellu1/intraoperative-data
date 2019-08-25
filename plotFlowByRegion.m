%% GLOBAL VARIABLES TO CHANGE
clear; clc; close all; 
load('../Equilibrium Data/leftRightSummary', 'leftRightSummary');

%% RETRIEVE DATA AND STORE IN GLOBAL VARIABLES
PIV_L = []; 
LIMA_L = []; 
SVG_L = []; 
RA_L = [];
RIMA_L = []; 
LAD_L = [];

PIV_R = []; 
LIMA_R = []; 
SVG_R = []; 
RA_R = [];
RIMA_R = []; 
LAD_R = []; 

%% LOAD DATA INTO VARIABLES 
for i = 1:size(leftRightSummary,1)
    caseNum = cell2mat(leftRightSummary(i,1)); 
    name = cell2mat(leftRightSummary(i,2)); 
    fileName = '../Equilibrium Data/Case0'; 
    if (caseNum < 10)
        fileName = strcat(fileName, '0', int2str(caseNum), '/'); 
    elseif(caseNum < 100)
        fileName = strcat(fileName, int2str(caseNum), '/'); 
    end
    fileName = strcat(fileName, name, '_avg'); 

    try
        load(fileName, 'saveAverageData');
        average = saveAverageData(size(saveAverageData,1),2);
        if (average < 0) 
            average = average * -1; 
        end
        average = average * 1000; 
        if (strcmpi(leftRightSummary(i,3),'L'))
            if (strcmpi(name, 'LIMA') || strcmpi(name, 'LIMA2'))
                LIMA_L = [LIMA_L; average];
            elseif (strcmpi(name, 'PIV') || strcmpi(name, 'PIV2'))
                PIV_L = [PIV_L; average];
            elseif (strcmpi(name, 'SVG') || strcmpi(name, 'SVG2'))
                SVG_L = [SVG_L; average];
            elseif (strcmpi(name, 'RA') || strcmpi(name, 'RA2'))
                RA_L = [RA_L; average]; 
            elseif (strcmpi(name, 'RIMA') || strcmpi(name, 'RIMA2'))
                RIMA_L = [RIMA_L; average]; 
            elseif (strcmpi(name, 'LAD') || strcmpi(name, 'LAD2'))
                LAD_L = [LAD_L; average];
            end
        elseif (strcmpi(leftRightSummary(i,3),'R'))
            if (strcmpi(name, 'LIMA') || strcmpi(name, 'LIMA2'))
                LIMA_R = [LIMA_R; average];
            elseif (strcmpi(name, 'SVG') || strcmpi(name, 'SVG2'))
                SVG_R = [SVG_R; average];
            elseif (strcmpi(name, 'RA') || strcmpi(name, 'RA2'))
                RA_R = [RA_R; average]; 
            elseif (strcmpi(name, 'RIMA') || strcmpi(name, 'RIMA2'))
                RIMA_R = [RIMA_R; average]; 
            elseif (strcmpi(name, 'LAD') || strcmpi(name, 'LAD2'))
                LAD_R = [LAD_R; average];
            end
        end
    catch
        saveAverageData = 0; 
    end

end

%% PLOT DATA

grid on; 
hold on; 
xlim([0,3]); 
xticks([1 2]); 
xticklabels({'Left', 'Right'}); 

%Plot Raw Values
left_num = ones([size(LIMA_L,1),1]); 
s_LIMA = scatter(left_num, LIMA_L, 'r','x');
left_num = ones([size(PIV_L,1),1]); 
s_PIV = scatter(left_num, PIV_L, 'g','*');
left_num = ones([size(SVG_L,1),1]); 
s_SVG = scatter(left_num, SVG_L, 'b','+');
left_num = ones([size(RA_L,1),1]); 
s_RA = scatter(left_num, RA_L, 'm','s');
left_num = ones([size(RIMA_L,1),1]);
s_RIMA = scatter(left_num, RIMA_L, 'c','p');
left_num = ones([size(LAD_L,1),1]);
s_LAD = scatter(left_num, LAD_L, 'k','o');

right_num = 2.*(ones([size(LIMA_R,1),1]));
scatter(right_num, LIMA_R, 'r','x');
right_num = 2.*(ones([size(PIV_R,1),1]));
scatter(right_num, PIV_R, 'g','*');
right_num = 2.*(ones([size(SVG_R,1),1]));
scatter(right_num, SVG_R, 'b','+');
right_num = 2.*(ones([size(RA_R,1),1]));
scatter(right_num, RA_R, 'm','s');
right_num = 2.*(ones([size(RIMA_R,1),1]));
scatter(right_num, RIMA_R, 'c','p');
right_num = 2.*(ones([size(LAD_R,1),1]));
scatter(right_num, LAD_R, 'k','o'); 

%Plot Statistical Values
x_axis_average = [1,2];
left = [LIMA_L; PIV_L; SVG_L; RA_L; RIMA_L; LAD_L]; 
right = [LIMA_R; PIV_R; SVG_R; RA_R; RIMA_R; LAD_R];
y_axis_average = [mean(left), mean(right)]; 
y_axis_median = [median(left), median(right)]; 
standard_dev = [std(left), std(right)]; 
p = plot(x_axis_average, y_axis_median, '.b'); 
e = errorbar(x_axis_average, y_axis_average, standard_dev, '.k'); 
title('Average Equilibrium Flow Rate vs. Region');
ylabel('Average Flow (mL/min)'); 
lgd = legend([e,p,s_LIMA,s_PIV,s_SVG,s_RA,s_RIMA,s_LAD], {'mean/standard deviation', 'median','LIMA','PIV','SVG','RA','RIMA','LAD'}); 
lgd.Location = 'bestoutside'; 
e.LineStyle = 'none'; 
e.Marker = 'square'; 
e.MarkerFaceColor = 'black'; 
e.MarkerEdgeColor = 'black'; 
e.CapSize = 10; 
p.LineStyle = 'none'; 
p.Marker = 'diamond'; 
p.MarkerFaceColor = 'blue'; 
p.MarkerEdgeColor = 'blue'; 