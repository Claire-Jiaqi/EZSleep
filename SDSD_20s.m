function output = SDSD_20s(time)  


diff = zeros(1,19);

for q = 1:19
    diff(q) = (time(q+1)-time(q))*1000;
end
    
output = std(diff);
    
end