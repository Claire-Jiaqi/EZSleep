function output = feature2
    result = [];
    %before music
    for n = 1:20
    if(n < 10)
        Name = strcat('b00', num2str(n));
        d1_HR = period_HR(Name);
        d2_SDNN = SDNN_period(Name);
        d3_SDSD = SDSD_period(Name);
        d4_rMSSD = RMSSD_period(Name);
        result = [result; feature_table(d1_HR,0);feature_table(d2_SDNN,0);
            feature_table(d3_SDSD,0);feature_table(d4_rMSSD,0)];
    else
        Name = strcat('b0',num2str(n));
        d1_HR = period_HR(Name);
        d2_SDNN = SDNN_period(Name);
        d3_SDSD = SDSD_period(Name);
        d4_rMSSD = RMSSD_period(Name);
        result = [result; feature_table(d1_HR,0);feature_table(d2_SDNN,0);
            feature_table(d3_SDSD,0);feature_table(d4_rMSSD,0)];
    end
    end
    
    %after music
    for m = 1:15
    if(m < 10)
        Name = strcat('p00', num2str(m));
         d1_HR = period_HR(Name);
        d2_SDNN = SDNN_period(Name);
        d3_SDSD = SDSD_period(Name);
        d4_rMSSD = RMSSD_period(Name);
        result = [result; feature_table(d1_HR,1);feature_table(d2_SDNN,1);
            feature_table(d3_SDSD,1);feature_table(d4_rMSSD,1)];
    else
        Name = strcat('p0',num2str(m));
         d1_HR = period_HR(Name);
        d2_SDNN = SDNN_period(Name);
        d3_SDSD = SDSD_period(Name);
        d4_rMSSD = RMSSD_period(Name);
        result = [result; feature_table(d1_HR,1);feature_table(d2_SDNN,1);
            feature_table(d3_SDSD,1);feature_table(d4_rMSSD,1)];
    end
    
    end

    for q = 17:20
        Name = strcat('p0',num2str(q));
        d1_HR = period_HR(Name);
        d2_SDNN = SDNN_period(Name);
        d3_SDSD = SDSD_period(Name);
        d4_rMSSD = RMSSD_period(Name);
        result = [result; feature_table(d1_HR,0);feature_table(d2_SDNN,0);
            feature_table(d3_SDSD,0);feature_table(d4_rMSSD,0)];
    
    end
    output = result;
end