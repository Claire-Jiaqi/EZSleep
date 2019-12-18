clc;
[rr,tm]=ann2rr('b001','atr');
num = size(rr,1);
time = zeros;
j = 1;
for i = 1:num
    if(rr(i)>1000)
        time(j) = (rr(i)/5000)*1000 ;
        j = j+ 1;
    end
end
        
SDNN = std(time);