%  Figure 7.81      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.81
%% fig7_81.m 
%% Heat Exchanger
clf;
[t]=sim('Fig7_79cl');
plot(t,u,'LineWidth',2);
title('Fig. 7.81: Control effort for heat echanger');
xlabel('Time (sec)');
ylabel('Control, u');
grid; 





