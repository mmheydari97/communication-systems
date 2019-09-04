%% HW 4
%% Q2

clear
clc

miu = 0.5;

fm = 2;
fc = 1000;
fs = 4*fc;
L = 2;
t = linspace(0,L,L*fs);

%since ammod() gives suppressed carrier signal we define x of t as follow
x =1 + miu*sin(2*pi*fm*t);

u = ammod(x,fc,fs);

SNR1 = 10;
SNR2 = 14;

noise = randn(1,L*fs);

%define noise coefficients a1 and a2 to satisfy SNR
a1 = sqrt((u*u')/((noise*noise')*10^(SNR1/10)));
a2 = sqrt((u*u')/((noise*noise')*10^(SNR2/10)));

un1 = u + a1*noise;
un2 = u + a2*noise;

xr1 = (amdemod(un1,fc,fs)-1)/miu;
xr2 = (amdemod(un2,fc,fs)-1)/miu ;

figure
plot(t,un1);
legend('modulated signal passed AWGN channel with SNR = 10 dB')
figure
plot(t,un2);
legend('modulated signal passed AWGN channel with SNR = 14 dB');

figure
pwelch(un1);
legend('SNR = 10 dB');

figure
pwelch(un2);
legend('SNR = 14 dB');

figure
plot(t,xr1);
legend('recieved signal with SNR = 10 dB')
figure
plot(t,xr2);
legend('recieved signal with SNR = 14 dB');

figure
load('Num.mat')
plot(t,filter(Num,1,xr1))

