%  Figure 3.17      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.17
%  fig3_17.m      
%  Example 3.25    
clf;
s=tf('s');
sys=(2*s+1)/(s^2+3*s+2);
t=0:0.1:6;
y=impulse(sys,t);
plot(t,y,'-','LineWidth',2)
title('Fig. 3.17: Example 3.25 system impulse response.')
xlabel('Time (sec)')
ylabel('h(t)')
grid 