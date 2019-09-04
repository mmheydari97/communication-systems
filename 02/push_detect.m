%% Sol-2

%simulating modulated signal after passing rectifier
up=zeros(1,L*fs);
up(u>0)=u(u>0);
%tau=R*C and must be between 1/fc , 1/(2*pi*fm) or 0.01<tau<0.15
tau=[0.001 0.1 0.3];

h1=2*pi*exp(-t/tau(1));
y1= conv(h1,up);
y1=y1(1:L*fs);
figure
yn1=y1-mean(y1);
plot(t,yn1);

h2=2*pi*exp(-t/tau(2));
y2= conv(h2,up);
y2=y2(1:L*fs);
figure
yn2=y2-mean(y2);
plot(t,yn2);

h3=2*pi*exp(-t/tau(3));
y3= conv(h3,up);
y3=y3(1:L*fs);
figure
yn3=y3-mean(y3);
plot(t,yn3);
