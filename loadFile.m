%On its own, this file does not accomplish anything. I just kept it
%as a reminder of how to open files if they exist

try 
    load('Equilibrium Data/Case010/LIMA', 'saveEquilibriumData'); 
catch
    saveEquilibriumData = 0;  
end