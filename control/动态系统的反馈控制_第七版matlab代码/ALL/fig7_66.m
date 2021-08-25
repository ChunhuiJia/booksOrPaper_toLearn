%  Figure 7.66      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.66
% fig7_66.m    
clf;
n1=[5 25];
d=[1 10 25];
step([8 25],d)
hold on
step(n1, d);
step(25,d);
title('Fig. 7.66: Step response of integral control with feedforward');
%xlabel('Time (sec)');
ylabel('Amplitude');
text(0.5,.8,'N = 0');
text(.4,.9,'N= 5');
text(.4,1.1,'N = 8');
grid
hold off
 
