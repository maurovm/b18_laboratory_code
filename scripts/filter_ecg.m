% File         : filter_ecg.m
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
%    Function to band-pass filter ECG data
%
% INPUT:
% ------
%
%   signal: a [N x 1] vector of ECG data, where N are the number of samples;
%
%   fs:     sampling frequency [Hz]
%
%   Fhigh:  high-pass frequency [Hz]
%           default: 0.5 Hz
%
%   Flow:   low-pass frequency [Hz]
%           default:  100 Hz
%
%   Norder: filter order 
%           default:4
%
% Output:
% ------
%
%   filtered_signal: a [N x 1] vector of band-pass filtered ECG data 
% ________________________________________________________________________

function filtered_signal=filter_ecg(signal,fs, varargin)

%% Parse Arguments

optargs = {0.5 25 4};  % default values for input arguments
newVals = cellfun(@(x) ~isempty(x), varargin);
optargs(newVals) = varargin(newVals);
[Fhigh, Flow, Norder] = optargs{:};
clear optargs newVals

%% Design the filter and apply filtering to the signal

d_bp=design(fdesign.bandpass('N,F3dB1,F3dB2',Norder,Fhigh,Flow,fs),'butter');

% Convert to transfer function

[b_bp,a_bp] = tf(d_bp);
filtered_signal = filtfilt(b_bp,a_bp,signal);

end 
