%%Mohammad Mahdi Heydari
%%9423045
%%Matlab HW1 Communication Systems 1

close all;
clc;
clear;

%Q5

%suppose T=2pi

%index of y in each statement shows the number of terms in series we've
%proceeded

t=linspace(0,2*pi,500);
y1=4/pi*sin(t);
plot(t,-sign(t-pi));
title('the gibbs phenomenon in fourier series');
hold on 

plot(t,y1);
hold on

y5=0;
for i=0:5
    y5=y5 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y5);
hold on

y3=0;
for i=0:3
    y3=y3 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y3);
hold on

y7=0;
for i=0:7
    y7=y7 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y7);
hold on

y10=0;
for i=0:10
    y10=y10 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y10);
hold on

y20=0;
for i=0:20
    y20=y20 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y20);
hold on

y50=0;
for i=0:50
    y50=y50 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y50);
hold on

y100=0;
for i=0:100
    y100=y100 + 4./(pi*(2*i+1)) * sin((2*i+1)*t);
end;
plot(t,y100);
hold on




