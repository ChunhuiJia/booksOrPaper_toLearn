%  Figure 7.52      Feedback Control of Dynamic Systems, 7e
%                         Franklin, Powell, Emami
%
% script for Fig. 7.52             
% 
clf;
dp=[1 1 0];
np=[1];
sysp=tf(np,dp);
nc=conv([1 1],[8.32 0.8]);
dc=conv([1 4.08],[1 0.0196]);
sysc=tf(nc,dc);
syscl=feedback(sysc*sysp,1);
t=0:.01:5;
y=step(syscl,t);
figure(1)
plot(t,y,'LineWidth',2)
xlabel('Time (sec)');
ylabel('y');
title('Fig.7.52(a): Step response for lag compensation design');
grid;
% Control effort
sysclu=feedback(sysc,sysp);
u=step(sysclu,t);
figure(2)
plot(t,u,'LineWidth',2);
xlabel('Time (sec)');
ylabel('u');
title('Fig.7.52(b): Control effort for lag compensation design');
grid;
