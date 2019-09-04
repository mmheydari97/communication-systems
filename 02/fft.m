clc;clear;close all;
tmin = 0; tmax = 8*10^(-3); step = (tmax-tmin)/10000;
t = tmin:step:tmax;  % 1/step = Frequency of Sampling
fm = 2*10^3;    
Vm = 1;     
m = Vm*sin(2*pi*fm*t);
plot(t,m,'r')
grid on 

%%% FFT or Fast Fourier Transform from m(t)
FFT_length = length(m);
Frequency = linspace(-1,1,FFT_length)/step/2; % define freq. between -Fs/2 to Fs/2
M = fftshift(fft(m,FFT_length)); % fourier transform
figure;
stem(Frequency, abs(M),'-*','linewidth',2) % abs is beacause of magnitude
grid on;title('Fourier Transform of m(t)');
xlabel('Frequency in Hz');ylabel('Fourier Transform Magnitude')
xlim([-6*fm +6*fm])