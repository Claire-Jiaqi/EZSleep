function output = RMSSD_20s(time)
    
sum = 0;
totalNum = 0;   
for q = 1:19
    sum = sum + ((time(q+1)-time(q))*1000)^2;
    totalNum = totalNum + 1;
end
output = sqrt(sum/totalNum);
    
end