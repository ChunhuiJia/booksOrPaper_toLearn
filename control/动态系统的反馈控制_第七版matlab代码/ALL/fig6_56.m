%  Figure 6.56      Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
% 
%
clear all
%close all;
clf

k=10;
s=tf('s');
sysG=1/(s*(s+1));
sysD=(s/2+1)/(s/10+1);
sysT=feedback(k*sysD*sysG,1);
t=0:.05:5;
y=step(sysT,t);
plot(t,y);
axis([0 2 0 1.4])
grid minor
xlabel('Time (sec)');
ylabel('y');
title('Fig. 6.56 Step response of lead-compensation design.');
