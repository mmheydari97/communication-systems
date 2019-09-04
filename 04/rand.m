%% HW 4 
%% SOL 1

clear 
clc

max_range = 10;
min_range = 2;
length1 = 100;

num100 = min_range + (max_range - min_range)*rand(1,length1);
m1 = mean(num100);
figure
hist(num100)

length2 = 1000;

num1000 = min_range + (max_range - min_range)*rand(1,length2);
m2 = mean(num1000);
figure
hist(num1000)

gauss100 = normrnd(0,1,1,length1);
mg1 = mean(gauss100);
figure
hist(gauss100);

gauss1000 = normrnd(0,1,1,length2);
mg2 = mean(gauss1000);
figure
hist(gauss1000);