function output = exact_feature

result = [];
% deal with before music
for i = 1:20
    if(i < 10)
    name_before = strcat('b00', num2str(i));
    [rr,tm]=ann2rr(name_before,'atr');
    num = size(rr,1);
    data_len = 20;
    data_size = floor(num/data_len);
    m = 1;
    n = data_len;
    for j = 1:data_size
        period = rr(m:n);
        % 0 is the label represent: before listen to music
        result = [result;piece_feature(period,0)];
        m = m + data_len;
        n = n + data_len;
    end   
    else
    name_before = strcat('b0',num2str(i));
    [rr,tm]=ann2rr(name_before,'atr');
    num = size(rr,1);
    data_len = 20;
    data_size = floor(num/data_len);
    m = 1;
    n = data_len;
    for j = 1:data_size
        period = rr(m:n);
        % 0 is the label represent: before listen to music
        result = [result;piece_feature(period,0)];
        m = m + data_len;
        n = n + data_len;
    end   
    end
end


% deal with the data: after music
for i = 1:20
    if(i < 10)
    name_after = strcat('p00', num2str(i));
    [rr,tm]=ann2rr(name_after,'atr');
    num = size(rr,1);
    data_len = 20;
    data_size = floor(num/data_len);
    m = 1;
    n = data_len;
    for j = 1:data_size
        period = rr(m:n);
        % 0 is the label represent: before listen to music
        result = [result;piece_feature(period,1)];
        m = m + data_len;
        n = n + data_len;
    end   
    else
    name_after = strcat('p0',num2str(i));
    [rr,tm]=ann2rr(name_after,'atr');
    num = size(rr,1);
    data_len = 20;
    data_size = floor(num/data_len);
    m = 1;
    n = data_len;
    for j = 1:data_size
        period = rr(m:n);
        % 0 is the label represent: before listen to music
        result = [result;piece_feature(period,1)];
        m = m + data_len;
        n = n + data_len;
    end   
    end
   output = result;
end


