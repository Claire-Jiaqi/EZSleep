function output = period_HR(Name)

wfdb2mat(Name);
infoName = strcat(Name, 'm.hea');
matName = strcat(Name, 'm.mat');
load(matName);

%only get the 240 s of the data
getData = val(:,1:1200000);

fid = fopen(infoName, 'rt');

%get the sampling frequency and sampling interval
%use the format to ge the data in the str of fid
str = regexp(fgetl(fid),' ','split');
interval = 1/str2double(str(3));
frequency = str2double(str(3));
for i = 1:size(val, 1)
    data(i,:) = regexp(fgetl(fid),'[^-?0-9a-zA-z\.]','split');
end

%i is the number of rows in A
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

result = zeros(1,44);
RR = RR_min(Name);
% the length of the time is 20s
time_period = 20;
inter = 5;
x1 = 1;
x2 = time_period * frequency;
x = (1:time_period * frequency) * interval;
%method 1: use min RR to detect the HR
for j = 1:44
    %[pks,locs] = findpeaks(getData(1,x1:x2),x);
    [pks,locs] = findpeaks(getData(1,x1:x2),x,'MinPeakDistance',RR);
    result(j) = size(pks,2)*2;
    x1 = x1 + inter * frequency;
    x2 = x2 + inter * frequency;
end

output = result;    






