%  Figure 4.4     Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
%
s=tf('s'); 
G=2/(s^2+s+2);
% add integrator
sysG=G/s;
t=0:.03:10;
y=step(sysG,t);
axis('square');
plot(t,t,t,y);
title('Fig. 4.4: Relationship between ramp response and K_v');
xlabel('Time (sec)');
ylabel('r, y');
axis('normal')
gtext('r')
gtext('y')
gtext('e_{ss}= 1/K_v')
grid;