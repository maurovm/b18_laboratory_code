% File         : startup.m
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
% Startup script
% Run this file at the beginning of the lab to extract the data and set up
% your folders for analysis and results. 
% ________________________________________________________________________


[b18lab_pathname, ~, ~] = fileparts(mfilename('fullpath'));
cd(b18lab_pathname)

scripts_pathname=[b18lab_pathname, filesep, 'scripts'];
data_pathname=[b18lab_pathname, filesep, 'data'];
save_pathname=[b18lab_pathname, filesep, 'results'];
cd(data_pathname)

if ~isfolder(save_pathname)
    mkdir(save_pathname); end 

%% Add all the paths

addpath(data_pathname)
addpath(scripts_pathname)
addpath(save_pathname)

%% Unpack the data

get_data(data_pathname, 'ECG');
get_data(data_pathname, 'EEG');
get_data(data_pathname, 'GAIT');

%% Return to the B18 main directory 

cd(b18lab_pathname)
fprintf('Finished data extraction. Ready to start B18 lab\n')
