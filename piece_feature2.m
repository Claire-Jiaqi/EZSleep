function output = piece_feature2(data, label)
    num = size(data,2);
    data_len = 20;
    jump = 5;
    data_size = floor((num-data_len)/jump);
    m = 1;
    n = data_len;
    result = [];
    for j = 1:data_size
        period = data(m:n);
        result = [result;feature_table(period,label)];
        m = m + jump;
        n = n + jump;
    end 
    output = result;
end