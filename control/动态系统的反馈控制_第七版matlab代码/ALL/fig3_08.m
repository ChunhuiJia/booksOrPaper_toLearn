%  Figure 3.8      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.8
% fig3_08.m                                          
% Satellite Double-Pulse Response Example 3.21
%clf;
dI=1/5000;
sys=dI/s^2;
t=0:0.01:10;
% pulse input
u2=[zeros(1,500), 25*ones(1,10), zeros(1,100), -25*ones(1,10), zeros(1,381)];
[y2]=lsim(sys,u2,t);
figure();
plot(t,u2,'LineWidth',2);
axis([0, 10, -26, 26]);
xlabel('Time (sec)');
ylabel('Thrust Fc');
title('Fig. 3.8(a): Thrust input')
grid
pause;
% conversion to degrees
ff=180/pi;
y2=ff*y2;
figure();
plot(t,y2,'LineWidth',2);
xlabel('Time (sec)');
ylabel('\theta (deg)');
title('Fig. 3.8(b): Satellite attitude') 
grid

