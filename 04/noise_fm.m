%% HW 4
%% Q2

clear
clc

fm = 1;
fc = 50;
fs = 10*fc;
kf = 20;

L = 2;
%L = 5; for more detail
t = linspace(0,L,L*fs);

%Bandpass filter object
load('Hd.mat');
%Lowpass filter object
load('Ld.mat');

x = sin(2*pi*fm*t);
fdev = max(abs(x))*kf;

ut = fmmod(x,fc,fs,fdev);
noise = randn(1,L*fs);
SNR = 3:22;

%noise coefficients
a1 = sqrt((ut*ut')/((noise*noise')*10^(SNR(1)/10)));
a2 = sqrt((ut*ut')/((noise*noise')*10^(SNR(8)/10)));
a3 = sqrt((ut*ut')/((noise*noise')*10^(SNR(13)/10)));
a4 = sqrt((ut*ut')/((noise*noise')*10^(SNR(20)/10)));

um1 = ut + a1*noise;
um2 = ut + a2*noise;
um3 = ut + a3*noise;
um4 = ut + a4*noise;

%now we apply bandpass filter
umid1 = filter(Hd,um1);
umid2 = filter(Hd,um2);
umid3 = filter(Hd,um3);
umid4 = filter(Hd,um4);

%ur is umid passed fm demodulator
ur1=fmdemod(umid1,fc,fs,fdev);
ur2=fmdemod(umid2,fc,fs,fdev);
ur3=fmdemod(umid3,fc,fs,fdev);
ur4=fmdemod(umid4,fc,fs,fdev);

figure
pwelch(ut);
legend('modulated signal without noise');

figure
pwelch(ur1);
legend('demodulated - SNR 3');

figure
pwelch(ur2);
legend('demodulated - SNR 10');

figure
pwelch(ur3);
legend('demodulated - SNR 15');

figure
pwelch(ur4);
legend('demodulated - SNR 22');

%Final signal passed lowpass filter
uf1 = filter(Ld,ur1);
uf2 = filter(Ld,ur2);
uf3 = filter(Ld,ur3);
uf4 = filter(Ld,ur4);

figure
pwelch(uf1);
legend('lowpassed - SNR 3');

figure
pwelch(uf2);
legend('lowpassed - SNR 10');

figure
pwelch(uf3);
legend('lopassed - SNR 15');

figure
pwelch(uf4);
legend('lowpassed - SNR 22');

%now we calculate final SNR
SNR1 = 10*log10((uf1*uf1')/(ur1*ur1'-uf1*uf1'));
SNR2 = 10*log10((uf2*uf2')/(ur2*ur2'-uf2*uf2'));
SNR3 = 10*log10((uf3*uf3')/(ur3*ur3'-uf3*uf3'));
SNR4 = 10*log10((uf4*uf4')/(ur4*ur4'-uf4*uf4'));
