%% Sol-3

clear
clc

%frequency of message(khz)
fm=10;
%frequency of carrier(khz)
fc=100;
%L=time length
L=1;
%fs=sampling frequency
fs=8*fc;
t=linspace(0,L,L*fs);

%%message
x=cos(2*pi*fm*t);
kf=60;
kp=3*pi*2;
phi=kf/fm*sin(2*pi*fm*t);
%%int=(cumsum(x)-1)/((max(cumsum(x))-min(cumsum(x)))/2);

%%transmitted signal

sfm=cos(2*pi*fc*t + phi);
spm=cos(2*pi*fc*t + kp*x);

dfm=zeros(1,fs*L);
dfm(2:fs*L)=diff(sfm);

dpm=zeros(1,fs*L);
dpm(2:fs*L)=diff(spm);

figure
plot(t,dfm);
title('fm signal after passing differentiator');

figure
plot(t,dpm);
title('pm signal after passing differentiator');

rfm=zeros(1,L*fs);
rfm(dfm>0)=dfm(dfm>0);
figure
plot(t,rfm);
title('fm signal after passing rectifier');

rpm=zeros(1,L*fs);
rpm(dpm>0)=dpm(dpm>0);
figure
plot(t,rpm);
title('pm signal after passing rectifier');

%%numerator from fdatool
load('Num.mat')

%%output from fm signal demodulation
ofm=filter(Num,1,rfm);
%%output from pm signal demodulation
opm=filter(Num,1,rpm);

%normalization
ofm=( ofm-mean(ofm))/max(ofm);
ofm=ofm/max(ofm);
opm=( opm-mean(opm))/max(opm);
opm=opm/max(opm);

figure
plot(t,ofm);
hold on
plot(t,x);
legend('output from fm demodulation','original message');

figure
plot(t,opm);
hold on
plot(t,x);
legend('output from pm demodulation','original message');
