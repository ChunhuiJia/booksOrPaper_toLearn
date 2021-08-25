% Fig. 2.19b   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%    (requires fig2_19bx.slx)

clear all;
%close all;

% response comparison of linear and nonlinear
clear
clf
[tout,yout]=sim('fig2_19bx');
hold on
plot(tout,57.3*yout(:,1))
plot(tout,57.3*yout(:,2),'r--')
title('Figure 2.19b Step Responses for 4N ')
ylabel('\theta (Deg)')
xlabel('Time (sec)')
axis([0 10 0 50])
grid
hold off

