%%sol Q3

clear
clc
%frequency of message
fm=1;
%frequency of carrier
fc=100;
%frequency of sampling
fs=500;
%L=length which is 2 seconds
L=2;
%gain assumed 10 
Ac=10;

t=linspace(0,L,L*fs);

m=2*cos(2*pi*fm*t)+cos(4*pi*fm*t);
figure
plot(t,m);
title('signal of message');

hilbert=(1./t)/pi;
%a big number instead of inf 
hilbert(1)=50*L*fs;
mhat=conv(m,hilbert);
mhat=mhat(1:L*fs);
su=Ac*(m.*cos(2*pi*fc*t)-mhat.*sin(2*pi*fc*t));
sl=Ac*(m.*cos(2*pi*fc*t)+mhat.*sin(2*pi*fc*t));

figure
plot(t,su);
hold on
plot(t,sl)
legend('ussb','lssb');

%Using the formula in HW5 Question 4
slhat=conv(sl,hilbert);
slhat=slhat(1:fs*L);
suhat=conv(su,hilbert);
suhat=suhat(1:fs*L);

mr1=-(2/Ac)*(su.*cos(2*pi*fc*t) + suhat.*sin(2*pi*fc*t));
mr2=(2/Ac)*(sl.*cos(2*pi*fc*t) + slhat.*sin(2*pi*fc*t));

figure
plot(t,mr1);
legend('message from ussb');
figure
plot(t,mr2)
legend('message from lssb');

%frequency domain
figure
pwelch(mr1, [],[],[],fs ,'centered');
figure
pwelch(mr2, [],[],[],fs ,'centered');

%now we use LPF to see what happens to received message
mn=conv(mr1,exp(-60*t));
mn=mn(1:fs*L);
figure
plot(t,0.5*mn/10^10)
legend('message from LFP');