%% Variables to manually change

%Adjust this value until a visible pattern emerges in "difference"
topPercentile = 9/10; 

%First timestep where a steady pattern has been established
firstTimeStep = 4167; 

%MeasurementSet and Measurement
measurementSet = 3; 
measurement = 1; 

%% Read and plot VeriQ data
sDefaultDir = 'data\';
[sFileName, sPathName] = uigetfile('*.xml','Select a VeriQ xml file',sDefaultDir);
p.fileDir = sPathName;
p.fileName = sFileName;
%p.patientNo =  2;                  % Patient number index [1, ...]
%p.caseNo = 1;                      % Case index [1, ...]
p.measurementSetNo = -1;            % Measurement set index [1, ...]
p.measurementNo = -1;               % Array of measurement numbers, -1 = all measurements
bReadDopplerSpectra = false;        % Skip (time-consuming) reading of Doppler spectra
%% Read data and parse peaks

Data = readVeriQData(p, bReadDopplerSpectra); 

maxima = findMaxima(Data.Patient{1,1}.Case{1,1}.MeasurementSet{measurementSet});
[sortedmaxima, sortedHighestPeaks, differences] = findEquilibrium(maxima, topPercentile);

disp(' '); 
disp('CURVE TYPE:'); 
disp(Data.Patient{1,1}.Case{1,1}.MeasurementSet{measurementSet}.Measurement{measurement}.curveType); 
disp('VESSEL NAME:'); 
disp(Data.Patient{1,1}.Case{1,1}.MeasurementSet{measurementSet}.Measurement{measurement}.VesselName);

%% Calculate equilibrium data
equilibriumData = Data.Patient{1}.Case{1}.MeasurementSet{measurementSet}.Measurement{measurement}.curves.pulsatileCurve;
[r,c] = size(equilibriumData); 
equilibriumData = equilibriumData(firstTimeStep:r);

averageEquilibriumData = zeros(1,r - firstTimeStep + 1); 
currentSum = 0;
for i = 1:(r - firstTimeStep + 1)
    currentSum = currentSum + equilibriumData(i); 
    averageEquilibriumData(i) = currentSum / i; 
end
averageEquilibriumData = transpose(averageEquilibriumData); 

recordedTime = Data.Patient{1,1}.Case{1,1}.MeasurementSet{measurementSet}.RecordedLength; 
equilibriumStartTime = recordedTime * (firstTimeStep / r); 
t = linspace(equilibriumStartTime, recordedTime, (r - firstTimeStep + 1)); 
t = transpose(t); 

saveEquilibriumData = [t equilibriumData]; 
saveAverageData = [t averageEquilibriumData]; 

%% Plot Equilibrium Data
plot(t, equilibriumData);
grid on;
hold on; 
plot(t, averageEquilibriumData, 'r'); 
xlabel('Time (s)'); 
ylabel('Flow Rate(L/min)'); 