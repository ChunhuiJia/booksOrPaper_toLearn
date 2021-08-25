% Fig. 2.19a   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%    (requires fig2_19ax.slx)

clear all;
%close all;

% response comparison of linear and nonlinear
clear
clf
[tout,yout]=sim('fig2_19ax');
hold on
plot(tout,57.3*yout(:,1))
plot(tout,57.3*yout(:,2),'r--')
title('Figure 2.19a Step Responses for 1N ')
ylabel('\theta (Deg)')
xlabel('Time (sec)')
axis([0 10 0 50])
grid
hold off

