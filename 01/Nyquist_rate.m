%%Mohammad Mahdi Heydari
%%9423045
%%Matlab HW1 Communication Systems 1


close all;
clc;
clear; 

%% Q6

t1 = -2: 0.1:2;
t2 = -2:0.05:2;
t3 = -2:0.02:2;

y1=sin(10*pi*t1) + sin(20*pi*t1);
y2=sin(10*pi*t2) + sin(20*pi*t2);
y3=sin(10*pi*t3) + sin(20*pi*t3);

hold
subplot(3,1,1);
plot(t1,y1);
ylabel('f : 10 Hz');
subplot(3,1,2);
plot(t2,y2);
ylabel('f : 20 Hz');
subplot(3,1,3);
plot(t3,y3);
ylabel('f : 50 Hz');

%We lose data if fc<2fm !

