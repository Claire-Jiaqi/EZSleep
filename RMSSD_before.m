clc;
result_before = zeros(1,20);
result_after = zeros(1,20);
%before
for n = 1:20
    if(n < 10)
        name = strcat('b00', num2str(n));
    else
        name = strcat('b0',num2str(n));
    end
    [rr,tm]=ann2rr(name,'atr');
    num = size(rr,1);
    time = zeros;
    j = 1;
    for i = 1:num
        if(rr(i)>1000)
          time(j) = rr(i)/5000;
          j = j+ 1;
        end
    end
        
    sum = 0;
    totalNum = 0;
    row = size(time,2);
    %Calculate the HRV using RMSSD
    for m = 1:row-1
        sum = sum + ((time(m+1)-time(m))*1000)^2;
        totalNum = totalNum + 1;
    end
    RMSSD = sqrt(sum/totalNum);
    result_before(n) = RMSSD;
end
%after
for n = 1:20
    if(n < 10)
        name = strcat('p00', num2str(n));
    else
        name = strcat('p0',num2str(n));
    end
    [rr,tm]=ann2rr(name,'atr');
    num = size(rr,1);
    time = zeros;
    j = 1;
    for i = 1:num
        if(rr(i)>1000)
          time(j) = rr(i)/5000;
          j = j+ 1;
        end
    end
        
    sum = 0;
    totalNum = 0;
    row = size(time,2);
    %Calculate the HRV using RMSSD
    for m = 1:row-1
        sum = sum + ((time(m+1)-time(m))*1000)^2;
        totalNum = totalNum + 1;
    end
    RMSSD = sqrt(sum/totalNum);
    result_after(n) = RMSSD;
end
figure;
ylabel('rMSSD');
title('Compare between the same person');
grid on; 
hold on;
x = (1:20);
plot(x,result_before, 'r-.', x,result_after, 'b-*');


