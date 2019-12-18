function HR_comparision(n)

if(n < 10)
    name_before = strcat('b00', num2str(n));
    name_after = strcat('p00', num2str(n));
else
    name_before = strcat('b0',num2str(n));
    name_after = strcat('p0',num2str(n));
end

result_before = period_HR(name_before);
result_after = period_HR(name_after);


x = (1:70);
subplot(3,1,1);
plot(x', result_before);
title('HR period before music');
subplot(3,1,2);
plot(x', result_after);
title('HR period after music');
subplot(3,1,3);
plot(x,result_before, 'r-.', x,result_after, 'b-*');
title('compare')

end



