%  Figure 4.9      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 4.9


%Proportional
% fpe7e_prop_1.eps
k=1.5;
zeta=0.707;
wn=1;
A=1;
s=tf('s');
t=0:.01:10;
% Disturbance with integral control
% 
ki=0.5
sysy=s*A/(s^3+2*zeta*wn*s^2+wn^2*s+ki*A)
figure()
subplot(2,1,1)
t=0:.01:30;
[y,t]=step(sysy,t);
plot(t,y,'LineWidth',2);
hold on;
plot(t,ones(size(t)),'--','LineWidth',2);
text(20,0.9,'$w(t)$','interpreter','latex');
axis([0 30 -0.5 1.2]);
xlabel('Time (sec)')
ylabel('$y(t)$','interpreter','latex');
title('Figure 4.9: Disturbance rejection');
grid;
subplot(2,1,2);
sysu=-ki*A/(s^3+2*zeta*wn*s^2+wn^2*s+ki*A)
[u,t]=step(sysu,t);
plot(t,u,'LineWidth',2)
xlabel('Time (sec)')
ylabel('$u(t)$','interpreter','latex');
grid;
hold off


