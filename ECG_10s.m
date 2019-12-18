function output = ECG_10s(Name)

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
if(Name == 'p016')
    for i = 1:size(val, 1)
        data(i,:) = regexp(fgetl(fid),'[^-?0-9a-zA-z\.]','split');
        if(i == 3)
            data(i,size(val,1)) = {0};
        end
    end
else
    for i = 1:size(val, 1)
        data(i,:) = regexp(fgetl(fid),'[^-?0-9a-zA-z\.]','split');
    end
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
%data = table(getData);
%writetable(data, 'csv\m001m.csv');

output = getData(1,:);

end
