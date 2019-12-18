function output = feature_table(input,marker)
   
    f1_mean = mean(input);
    f2_median = median(input);
    f3_std = std(input);
    f4_var = var(input);
    f5_rms = rms(input);
    f6_ave_dev = mean(diff(input));
    f7_skew = skewness(input);
    f8_kur = kurtosis(input);
    f9_iqr = iqr(input);
    %f10_zcr = zcr(input);
    %f11_se = pentropy(input);
    %result = [[f1_mean marker]; [f2_median marker]; [f3_std marker];
    %    [f4_var marker]; [f5_rms marker];[f6_ave_dev marker];[f7_skew marker];
    %    [f8_kur marker];[f9_iqr marker];[f10_zcr marker];[f11_se marker]];
    result2 = [f1_mean f2_median f3_std f4_var f5_rms f6_ave_dev f7_skew f8_kur f9_iqr marker];
    output = result2;
end