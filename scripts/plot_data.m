% File         : plot_data.m
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
%    Worker function to plot triaxial inertial sensor data
%
% INPUT:
% ------
%
%     SENSOR_DATA: a [N x C] matrix of inertial sensor data, where N are 
%     the number of samples and C are the number of channels such that:
%          SENSOR_DATA(:,1) - conatins the time vector
%          SENSOR_DATA(:,2) - X-axis sensor data
%          SENSOR_DATA(:,3) - Y-axis sensor data
%          SENSOR_DATA(:,4) - Z-axis sensor data
% 
%    options: structure containing optional inputs
%    - 'plot_title' a string containing a title statement adding text at
%    the top of the current axis.

%
% Output:
% ------
%
%   fig: figure handle
% ________________________________________________________________________

function fig=plot_data(SENSOR_DATA, options)


% Make figure; self explanatory

fig=figure;
plot(SENSOR_DATA(:, 1), SENSOR_DATA(:, 2)); hold on
plot(SENSOR_DATA(:, 1), SENSOR_DATA(:, 3)); hold on
plot(SENSOR_DATA(:, 1), SENSOR_DATA(:, 4)); hold on
xlabel('Time [s]')
ylabel('Acceleration (g\cdotm\cdots^{-2})')
legend('aX', 'aY', 'aZ')

% Optional input to plot a title

if isfield(options, 'plot_title')
title(options.plot_title); end 

% Make the positioning nice

fig.Position=[325 447 625 218];

end 
