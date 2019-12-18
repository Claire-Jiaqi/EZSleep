function output = RMSSD_period(Name)
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
    %270 RR interval: a group of 20 RR-intervals, 5 RR jump
    m = 1;
    n = 20;
    sum = 0;
    totalNum = 0;
    result = zeros(1,50);
    for p = 1:50
        for q = m:n-1
            sum = sum + ((time(q+1)-time(q))*1000)^2;
            totalNum = totalNum + 1;
        end
        result(p) = sqrt(sum/totalNum);
        m = m + 5;
        n = n + 5;
        sum = 0;
        totalNum = 0;
    end
    output = result;
    
end
   