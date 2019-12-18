function output = pentropy(input)
    P = sum(abs(fft(input)).^2);

    d=P(:);
    d=d/sum(d+ 1e-12);

    %Entropy Calculation
    logd = log2(d + 1e-12);
    output = -sum(d.*logd)/log2(length(d));