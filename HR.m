clc;
result_HR_before = zeros(1,20);
result_HR_after = zeros(1,20);
for n = 1:20
    if(n < 10)
        name = strcat('b00', num2str(n));
       
    else
        name = strcat('b0',num2str(n));
    end
    result_HR_before(n) = peek(name);
end

for n = 1:15
    if(n < 10)
        name = strcat('p00', num2str(n));
    else
        name = strcat('p0',num2str(n));
    end
    result_HR_after(n) = peek(name);
end

for n = 17:20
    name = strcat('p0',num2str(n));
    result_HR_after(n) = peek(name);
end



figure;
ylabel('HR');
title('HeartRate');
grid on; 
hold on;
x = (1:20);
plot(x,result_HR_before, 'r-.', x,result_HR_after, 'b-*');

    