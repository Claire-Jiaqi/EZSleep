function HR_n_comparision(n)

if(n < 10)
    name = strcat('m00', num2str(n));
  
else
    name = strcat('m0',num2str(n));
    
end

result_5 = period_n_HR(name,5);
result_15 = period_n_HR(name,15);
result_30 = period_n_HR(name,30);


x = (1:56);
subplot(4,1,1);
plot(x', result_5);
title('HR period for first 5 min');
subplot(4,1,2);
plot(x', result_15);
title('HR period for 15-20 mins');
subplot(4,1,3);
plot(x', result_30);
title('HR period for 30-35 mins');
subplot(4,1,4);
plot(x,result_5, 'r-.', x,result_15, 'b-*', x,result_30, 'g-*');
title('Compare');
legend('1-5', '15-20', '30-35');

end



