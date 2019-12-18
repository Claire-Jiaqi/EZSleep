function ECG_com(n)
if(n < 10)
    name_before = strcat('b00', num2str(n));
    name_after = strcat('p00', num2str(n));
else
    name_before = strcat('b0',num2str(n));
    name_after = strcat('p0',num2str(n));
end

result_before = ECG_10s(name_before);
result_after = ECG_10s(name_after);


x = (1:50000);
subplot(3,1,1);
plot(x', result_before);
xlabel('Time(s)');
ylabel('I (mv)');
title('ECG');
subplot(3,1,2);
plot(x', result_after);
xlabel('Time(s)');
ylabel('I (mv)');
subplot(3,1,3);
plot(x,result_before, 'r-.', x,result_after, 'b-*');
xlabel('Time(s)');
ylabel('I (mv)');

end



