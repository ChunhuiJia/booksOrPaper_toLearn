%  Figure 10.54      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_54a.m is a script to generate Fig. 10.53 (a)
% Kp=0.03333, and KI=0.01 corresponds to KpKs=2.0
clf;
[t,x,y,e]=sim('fig10_52and53a');

plot(t,e,'LineWidth',2);
xlabel('Time (sec)');
ylabel('e');
title('Fig. 10.53(a)');
grid 