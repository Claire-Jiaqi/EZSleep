function RMSSD(n)

if(n < 10)
    name_before = strcat('b00', num2str(n));
    name_after = strcat('p00', num2str(n));
else
    name_before = strcat('b0',num2str(n));
    name_after = strcat('p0',num2str(n));
end

result_before = RMSSD_period(name_before);
result_after = RMSSD_period(name_after);
title_name = strcat('Compare for sample ', num2str(n));

x = (1:50);
subplot(3,1,1);
plot(x', result_before);
title('RMSSD period before music');
subplot(3,1,2);
plot(x', result_after);
title('RMSSD period after music');
subplot(3,1,3);
plot(x,result_before, 'r-.', x,result_after, 'b-*');
title(title_name);
legend('before', 'after');

end



