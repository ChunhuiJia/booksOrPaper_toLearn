%  Figure 3.6      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.6
%% fig3_06.m
% Example 3.19 : DC Motor Angular velocity 
clf;
s=tf('s');
sysb=100/(s^2+10.1*s+101);
t=0:0.01:5;
y=step(sysb,t);
plot(t,y,'LineWidth',2);
title('Fig. 3.6: Step response');
xlabel('Time (sec)');
ylabel('\omega (rad/sec)');
grid 
