%  Figure 3.5     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.5
%% fig3_05.m    Example 3.7
%clf;
k=1;
s=tf('s');
sys=1/(s+k);                  % form transfer function
% sinusoidal input signal
deltaT = 0.001;
t=0:deltaT:10;                % form time vector
u=sin(10*(t));                % form input
[y]=lsim(sys,u,t);            % linear simulation
% plot response
figure();
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Output');
title('Fig. 3.5 (a): Transient response');
pause;
hold on;
y1=(10/101)*exp(-t);
phi=atan(-10);
y2=(1/sqrt(101))*sin(10*t+phi);
plot(t,y1,t,y2,t,y1+y2,'LineWidth',2);
% grid
nicegrid 
hold off;
pause;
figure();
ii=[9001:10001];
plot(t(ii),y(ii),t(ii),u(ii),'LineWidth',2);
xlabel('Time (sec)');
ylabel('Output, input');
title('Fig. 3.5 (b): Steady-state response');
text(9.4,0.65,'u(t)');
text(9.24,0.12,'y(t)');
% grid
nicegrid
