function plotATM(Name)

% usage: plotATM('RECORDm')
%
% This function reads a pair of files (RECORDm.mat and RECORDm.info) generated
% by 'wfdb2mat' from a PhysioBank record, baseline-corrects and scales the time
% series contained in the .mat file, and plots them.  The baseline-corrected
% and scaled time series are the rows of matrix 'val', and each
% column contains simultaneous samples of each time series.
%
% 'wfdb2mat' is part of the open-source WFDB Software Package available at
%    http://physionet.org/physiotools/wfdb.shtml
% If you have installed a working copy of 'wfdb2mat', run a shell command
% such as
%    wfdb2mat -r 100s -f 0 -t 10 >100sm.info
% to create a pair of files ('100sm.mat', '100sm.info') that can be read
% by this function.
%
% The files needed by this function can also be produced by the
% PhysioBank ATM, at
%    http://physionet.org/cgi-bin/ATM
%

% plotATM.m           O. Abdala			16 March 2009
% 		      James Hislop	       27 January 2014	version 1.1

infoName = strcat(Name, '.info');
matName = strcat(Name, '.mat');

% get the data from .mat file as val
load(matName);
fid = fopen(infoName, 'rt');
fgetl(fid);
fgetl(fid);
fgetl(fid);
[freqint] = sscanf(fgetl(fid), 'Sampling frequency: %f Hz  Sampling interval: %f sec');
interval = freqint(2);
fgetl(fid);


    %i is the number of rows in A
for i = 1:size(val, 1)
    [row(i), signal(i), gain(i), base(i), units(i)]=strread(fgetl(fid),'%d%s%f%f%s','delimiter','\t');
end
%the read of the .info file is ended
fclose(fid);


%if the data is invalid, NaN
val(val==-32768) = NaN;

%go through all the rows of the val
% deal with the siginal data
for i = 1:size(val, 1)
    
    val(i, :) = (val(i, :) - base(i)) / gain(i);
end
% need to plot based on the rows

x = (1:size(val, 2)) * interval;

subplot(4,1,1);
plot(x', val(1,:));
set(gca,'ytick',[-2:1:2]);
xlabel('Time(s)');
ylabel('I (mv)');
subplot(4,1,2);
plot(x', val(2,:));
set(gca,'ytick',[-1:0.5:1]);
xlabel('Time(s)');
ylabel('II (mv)');
subplot(4,1,3);
plot(x', val(3,:));
set(gca,'ytick',[-1:0.5:1]);
xlabel('Time(s)');
ylabel('Resp Band (mv)');
subplot(4,1,4);
plot(x', val(4,:));
set(gca,'ytick',[-10:4:10]);
xlabel('Time(s)');
ylabel('SCG');


end