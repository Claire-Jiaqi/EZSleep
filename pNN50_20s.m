function output = pNN50_20s(Name)
    
[rr,tm]=ann2rr(Name,'atr');
num = size(rr,1);
time = zeros;
j = 1;
for i = 1:num
   if(rr(i)>1000)
      time(j) = (rr(i)/5000);
      j = j+ 1;
   end
end    

period = time(1, 1:20);
sum = 0;

for q = 1:19
    if((period(q+1)-period(q))>50)
        sum = sum + 1;
    end
end
    
output = sum/20;
    
end