% File         : return_filenames_gait.m
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
%    Function to return the file information from the smartphone dataset:
% Harle, R., & Brajdic, A. (2017). Research data supporting "Walk detection
% and step counting on unconstrained smartphones" [Dataset].
%
% INPUT:
% ------
%
%       pathname - the pathname the data is stored
%             e.g. 'C:\DATASETS\ubicomp13\'
%       device_location -  a string to indicate which device location data 
%                          to extract. The options are: 
%                           'hand_held'
%                           'back_pocket'
%                           'handbag'
%                           'front_pocket'
%                           'backpack'
%
% Output:
% ------
%
%       fileinfo - a table consisting of the filenames extrcated and the
%       corresponding subject ID as strings. 
% ________________________________________________________________________


function fileinfo=return_filenames_gait(pathname, device_location)


%% Extract Data

% Check files exist

files=dir([pathname, filesep, '*.mat']);
filename(:,1)={files.name};
index=contains({files.name}, {device_location}, 'IgnoreCase',true);
filename=filename(index);
subject=cellfun(@get_subject, filename, 'UniformOutput', false);
fileinfo=table(filename, subject);

end 

% Helper function to gather the subject ID
function subject=get_subject(filename)

ui=regexp(filename, '_');
subject=filename(1:ui-1);

end
