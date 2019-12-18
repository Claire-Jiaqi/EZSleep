function plotATM2(Name)

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

%headName = strcat(Name,'.dat');
wfdb2mat(Name);
infoName = strcat(Name, 'm.hea');
matName = strcat(Name, 'm.mat');

% get the data from .mat file as val
load(matName);

%only get the 10 s of the data
getData = val(:,1:50000);

fid = fopen(infoName, 'rt');


%get the sampling frequency and sampling interval
%use the format to ge the data in the str of fid
str = regexp(fgetl(fid),' ','split');
interval = 1/str2double(str(3));

%i is the number of rows in A
for i = 1:size(val, 1)
    data(i,:) = regexp(fgetl(fid),'[^-?0-9a-zA-z\.]','split');
end

%the read of the .info file is ended
fclose(fid);
for i = 1:size(val, 1)
    gain(i) = str2double(data(i,4));
    base(i) = str2double(data(i,5));
    units(i) = data(i,7);
end

%if the data is invalid, NaN
getData(getData==-32768) = NaN;

%go through all the rows of the val
% deal with the siginal data
for i = 1:size(val, 1)    
    getData(i, :) = (getData(i, :) - base(i)) / gain(i);
end
% need to plot based on the rows

x = (1:size(getData, 2)) * interval;

subplot(4,1,1);
plot(x', getData(1,:));
%set(gca,'ytick',[:1:]);
xlabel('Time(s)');
ylabel('I (mv)');
subplot(4,1,2);
plot(x', getData(2,:));
%set(gca,'ytick',[-1:0.5:1]);
xlabel('Time(s)');
ylabel('II (mv)');
subplot(4,1,3);
plot(x', getData(3,:));
%set(gca,'ytick',[-1:0.5:1]);
xlabel('Time(s)');
ylabel('Resp Band (mv)');
subplot(4,1,4);
plot(x', getData(4,:));
%set(gca,'ytick',[-10:4:10]);
xlabel('Time(s)');
ylabel('SCG');

end