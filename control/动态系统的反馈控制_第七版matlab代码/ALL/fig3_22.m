%  Figure 3.22     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.22
% fig3_22.m 
clf;
sys=(2*s+1)/(s^2+2*s+5);% form transfer function
t=0:.1:6;        % define time vector
y=impulse(sys,t); % compute impulse response
plot(t,y,'LineWidth',2)
hold on
% compute 2e^(-t)
syse=2/(s+1);
ye=impulse(syse,t);
plot(t,ye,':r','LineWidth',2)
plot(t,-ye,':r','LineWidth',2),
axis([0 6 -2 2])
hold off
title('Figure 3.22: system response for Example 3.25')
xlabel('Time (sec)')
ylabel('h(t)')
grid 