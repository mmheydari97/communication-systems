%% Sol-1

clear
clc
%frequency of message(khz)
fm=1;
%frequency of carrier(khz)
fc=100*fm;
%L=time length
L=2;
%fs=sampling frequency
fs=500;
t=linspace(0,L,L*fs);

%function that models the message
m=4*cos(2*pi*fm*t-pi/9)+2*sin(4*pi*fm*t);
%extremum of it
mx=max(abs(m));

%the time at which extremum happens
tx=t(m==mx);
%tx=0.1051 is observed from plot

%normalized massage
mn=m/mx;


figure
plot(t,m);
hold on 
plot(t,mn);
xlabel('time (ms)');
legend('message signal','normalized message signal');
%Power of carrier signal assumed 50 Watts so Ac will be 10
%Modulation index is 0.5
Ac=10;
a=0.5;

%Power of normalized message signal
Pmn=(1/L)*(mn*mn');

%efficiency of transmission
eta = 100*(a^2*Pmn)/(1+a^2*Pmn);

%u(t) is the signal that transmitter sends;
u=Ac*(1+a*mn).*cos(2*pi*fc*t);

figure
plot(t,u);
xlabel('time (ms)');


Uf=fft(u);

A2 = abs(Uf/(L*fs));
A1 = A2(1:(L*fs)/2+1);
A1(2:end-1) = 2*A1(2:end-1);

%creating f axis for plot
f = fs*(0:(L*fs/2))/(fs*L);
figure
plot(f,A1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (kHz)')
ylabel('|X(f)|')

P2 = phase(Uf/(L*fs));
P1 = P2(1:(L*fs)/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure
plot(f,P1) 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (kHz)')
ylabel(['\phi','X(f)']);

%%Also pwelch(u, [],[],[],fs ,'centered');