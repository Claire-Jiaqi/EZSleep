function minOut = RR_min(Name)
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
    minOut =  min(time);   
end