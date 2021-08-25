%Figure 4.23   Feedback Control of Dynamic Systems, 7e
%                      Franklin, Powell, Emami 
% script to generate Figure 4.23
% 
%clf;
%Tracking
s=tf('s');
% plant
G=1/(s^2+1.4*s+1);
t=0:0.1:10;
% Disturbance rejection
kp=1.5;
Tw1=(1-G)/(1+kp*G);
yw1=step(Tw1,t);
kp=6.0;
Tw2=(1-G)/(1+kp*G)
yw2=step(Tw2,t);
figure()
plot(t,yw1,t,yw2,'LineWidth',2);
title('Figure 4.23: Disturbance rejection response');
xlabel('Time (sec)');
ylabel('$y(t)$','interpreter','latex');
text(2.5,-0.25,'$k_p = 1.5$','interpreter','latex')
text(2.5,0.2,'$k_p = 6$','interpreter','latex')
grid;