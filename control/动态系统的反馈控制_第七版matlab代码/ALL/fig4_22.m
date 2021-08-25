%Figure 4.22   Feedback Control of Dynamic Systems, 7e
%                      Franklin, Powell, Emami 
% script to generate Figure 4.22
% 
%clf;
%Tracking
s=tf('s');
% plant
G=1/(s^2+1.4*s+1);
kp=1.5;
% Closed-loop Transfer function
T1=G*(1+kp)/(1+kp*G);
t=0:.01:10;
% Step response
y1=step(T1,t);
kp=6.0;
T2=G*(1+kp)/(1+kp*G);
y2=step(T2,t);
figure()
plot(t,y1,t,y2,'LineWidth',2);
title('Figure 4.22: Tracking response');
xlabel('Time (sec)');
ylabel('$y(t)$','interpreter','latex');
text(2.5,1.25,'$k_p = 1.5$','interpreter','latex')
text(2.5,0.75,'$k_p = 6$','interpreter','latex')
grid;
