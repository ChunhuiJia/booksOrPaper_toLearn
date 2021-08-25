
%  Figure 3.7     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.7
%% fig3_07.m                                            
% Satellite Pulse response Example. 3.21 
%clf;
s=tf('s');
sysG=0.0002/s^2;
t=0:0.01:10;
%pulse input
u1=[zeros(1,500) 25*ones(1,10) zeros(1,491)];
[y1]=lsim(sysG,u1,t);
figure();
plot(t,u1,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Thrust Fc');
title('Fig. 3.7(a): Thrust input')
axis([0 10 0 26]);
grid
pause;
% conversion to degrees
ff=180/pi;
y1=ff*y1;
figure();
plot(t,y1,'LineWidth',2);
xlabel('Time (sec)'); 
ylabel('\theta (deg)');
title('Fig. 3.7(b): Satellite attitude')
grid

