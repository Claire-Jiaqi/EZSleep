function fft_20s
load ekg.mat; %??ecg??

[map,r,delay]=pan_tompkin(ecg,fs,0);% ??pan_tomkin????R?

[a,l]=size(r);

for i=2:l;

    t(i-1)=r(i)-r(i-1); %??R-R????????HRV

end

x=r(2:19);

y=interp1(x,t,r(2):1:r(19),'spline'); %?????????ecg??????fs?????

plot(y);hold on,

scatter(r(2:19)-r(2),t(1:18));

N=length(y);

N1=20;%???????? ?????fs/N=0.06Hz

AF=fft(y);

AF=abs(AF);%?????????????

f=(0:N1-1)*fs/N;

figure,plot(f,AF(1:N1));%?????fft???????????????????fft???????????

%?????????fft?????????fft????

