function [SF reduction] = factors(loads)
%% REDUCTION FACTORS
%-------------------------------------------------------------------------
% CHANGE LOG
% 14.11.2013    MUOE - PROGRAMMING
%-------------------------------------------------------------------------
% SAFETY FACTORS AXIAL LOADING
SF.description = 'Write explanation for choice of factors';
SF.comp = 1.4;   
SF.tens = 1.4;      
SF.weight_advan = 1.00;     
% REDUCTION FACTORS FOR AXIAL LOADING
reduction.skin_inner = 1.00;    
reduction.skin_tension = 1.00;
% PARTIAL SAFETY FACTORS FOR LATERAL LOADING DIN1054 VERIFICATION OF LATERAL CAPACITY (APPLIED ON SOIL Resistance & loads)
SF.R_ult = 1.4;
SF.B_hd = 1;
%MATERIAL FACTORS IN CASE SOIL.PSF==1 
SF.drained = 1.25;
SF.undrained = 1.3;