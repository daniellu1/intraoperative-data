%% Variables to manually change
clear; clc; close all; 

%Case Number
caseNum         =   26   ; 

%MeasurementSet and Measurement
measurementSet  =    22      ; 
measurement     =    1      ; 

%VesselName 
vesselNameString = 'SVG2'; 

%% Read and plot VeriQ data
caseNumString = ''; 
if (caseNum < 10) 
    caseNumString = strcat('00', int2str(caseNum));
elseif (caseNum < 100) 
    caseNumString = strcat('0', int2str(caseNum));
end
sDefaultDir = '../../..';
[sFileName, sPathName] = uigetfile(strcat(caseNumString,'*.xml'),'Select a VeriQ xml file',sDefaultDir);
p.fileDir = sPathName;
p.fileName = sFileName;
p.measurementSetNo = -1;            % Measurement set index [1, ...]
p.measurementNo = -1;               % Array of measurement numbers, -1 = all measurements
bReadDopplerSpectra = false;        % Skip (time-consuming) reading of Doppler spectra

Data = readVeriQData(p, bReadDopplerSpectra); 

%% Get raw data
flowData = Data.Patient{1}.Case{1}.MeasurementSet{measurementSet}.Measurement{measurement}.curves.pulsatileCurve;

%% Save raw data
uisave('flowData', strcat('../Equilibrium Data/Case', caseNumString, '/', vesselNameString, '_flow_raw')); 
