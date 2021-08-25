%  Figure 7.46      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. 7.46               
%  
% 
clf; 
% Plant
dp=[1 10 16 0];
np=[10];
sysp=tf(np,dp);
% Controller
nc=94.5*conv([1 7.98],[1 2.52]);
dc=conv([1 8.56 59.5348],[1 10.6]);
sysc=tf(nc,dc);
% Closed-loop system
syscl=feedback(sysc*sysp,1);
t=0:.01:5;
y=step(syscl,t);
% Control effort
sysclu=feedback(sysc,sysp);
u=step(sysclu,t);

figure(1)
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('y');
title('Fig.7.46(a): Step response');
grid;

u=step(sysclu,t);
figure(2)
plot(t,u,'LineWidth',2);
xlabel('Time (sec)');
ylabel('u');
title('Fig.7.46(b): Control effort');
grid;