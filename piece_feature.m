function output = piece_feature(period, label)

result = zeros(1,4);

result(1) = SDNN_20s(period);
result(2) = RMSSD_20s(period);
result(3) = SDSD_20s(period);

result(4) = label;
output = result;
end

