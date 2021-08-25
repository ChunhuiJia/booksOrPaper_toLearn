%  Figure 4.7     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Figure 4.7
%Proportional
%
k=1.5;
zeta=0.707;
wn=1;
A=1;
s=tf('s');
t=0:.01:10;
sysy=k*A/(s^2+2*zeta*wn*s+wn^2+k*A);
[y,t]=step(sysy,t);
figure()
plot(t,y,'LineWidth',2)
hold on;
plot(t,ones(size(t)),'--','LineWidth',2);
axis([0 10 0 1.3]);
xlabel('Time (sec)')
ylabel('$y(t)$','interpreter','latex');
title('Figure 4.7');
text(7.2,1.04,'$y = r$','interpreter','latex')
text(8.3,0.63,'$k_P = 1.5$','interpreter','latex')
text(8.3,0.9,'$k_P = 6$','interpreter','latex')
title('Proportional control');
grid;
k=6;
sysy=k*A/(s^2+2*zeta*wn*s+wn^2+k*A);
[y,t]=step(sysy,t);
plot(t,y,'LineWidth',2)
hold off

