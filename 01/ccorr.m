%%Mohammad Mahdi Heydari
%%9423045
%%Matlab HW1 Communication Systems 1

close all;
clc;
clear;

%%Q4

x = [zeros(1,9) 1+1i 2-2i 3+3i 4-4i 5+5i 6-6i 7+7i 8-8i 9+9i 10-10i];
y = [1+1i 2-2i 3+3i 4-4i 5+5i 6-6i 7+7i 8-8i 9+9i 10-10i];
y = conj(y);
a = repmat(x,10,1); 
for n=2:10
a(n,:) = circshift(x,1-n) ;
end
z = y * a;
t=-9:9;
stem(t,abs(z));
xlabel('this code');
y = conj(y);
g = xcorr(y,y);
figure
stem(t,abs(g));
xlabel('Matlab function');
