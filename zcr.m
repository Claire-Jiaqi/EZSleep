function output = zcr(input)
    result = 0;
    for i = 1:size(input,1)-1
        if((input(i+1) > 0 && input(i)<0) || (input(i+1) < 0 && input(i)>0))
            result = result + 1;
        end
    end
    output = result;
end