%  Figure 3.21      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.21
% fig3_21.m 
clf;
s=tf('s');
sys=1/(s^2+2*0.2*s+1);% form transfer function
den=[1 2*.2 1];
t=0:.01:30;       % define time vector
sys=tf(sys);  % define system
y=impulse(sys,t); % compute impulse response
plot(t,y,'LineWidth',2)
hold on
% compute e^(-.2t)

syse=1/(s+0.2);
ye=impulse(syse,t);
plot(t,ye,':r','LineWidth',2)
plot(t,-ye,':r','LineWidth',2),
axis([0 30 -1 1])
hold off
title('Figure 3.21')
xlabel('Time (sec)')
ylabel('h(t)')
text(7,.3,'e^{-\sigma t}');
text(7,-.3,'- e^{-\sigma t}');
grid 
