%% Sol-1

clear
clc

%frequency of message(khz)
fm=10;
%frequency of carrier(khz)
fc=100;
%L=time length
L=0.2;
%fs=sampling frequency
fs=8*fc;
t=linspace(0,L,L*fs);

%%message
x=cos(2*pi*fm*t);
kp=3*pi*2;

%%transmitted signal
%%solution for part A
s=cos(2*pi*fc*t + kp*x);


figure
plot(t,s);
title('s(t)=cos(2 \pi f_c t + k_p cos(2 \pi f_m t)');

%Part C
Sf=fft(s);
A2 = abs(Sf/(L*fs));
A1 = A2(1:(L*fs)/2+1);
A1(2:end-1) = 2*A1(2:end-1);

%creating f axis for plot
f = fs*(0:(L*fs/2))/(fs*L);
figure
plot(f,A1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (kHz)')
ylabel('|X(f)|')

%figure
%pwelch(s,[],[],[],fs);