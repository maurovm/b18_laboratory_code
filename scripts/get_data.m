
% File         : get_data.m
% Author       : Andrew Creagh
% Created on   : Jan 15, 2021
% Last updated : Jan 5, 2024$
% ________________________________________________________________________
%
% This file is part of ParamEstimator
%
% Copyright (C) 2021-2024 Andrew Creagh, Mauricio Villarroel. 
% All rights reserved.
%
% SPDX-License-Identifer:  GPL-2.0-only
%
% ________________________________________________________________________
%
% DESCRIPTON:
% ----------
%
%    Query whether the B18 data exists
%
%  Function to check if the B18_*DATASET*_data data folder exists with
%  files, and if not to unzip the files:
%  DATASET: 
%        - 'ECG'
%        - 'EEG'
%        - 'GAIT'
% ________________________________________________________________________


function [pathname_out, does_exist]=get_data(pathname, dataset)


pathname_out=[pathname, filesep, 'B18_', dataset '_data'];
if exist([pathname, filesep,  'B18_', dataset '_data'], 'dir')
    files=dir([pathname, filesep,  'B18_', dataset '_data', filesep, '*.mat']);
    if ~isempty(files)
        does_exist=true;
    return; 
    end
end 
if exist([pathname, filesep,  'B18_', dataset '_data', '.zip'], 'file')
    fprintf("Unzipping the B18_%s_data...\n", dataset)
    unzip([pathname, filesep,  'B18_', dataset '_data', '.zip'], [pathname, filesep,  'B18_', dataset '_data']); 
else
    err_msg=sprintf("Either: \n 1) Couldn't find the 'B18_%s_data' folder;\n 2) Couldn't find the orginal B18_%s_data.zip file;\n Check the directory pathname entered is correct...?\n This should be stored in your 'DATA' folder...\n Have you downloaded the data?",...
        dataset, dataset);
    error('prog:input', err_msg)
end

end 
