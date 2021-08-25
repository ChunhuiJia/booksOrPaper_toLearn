% Fig. 9.17   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script for Figure 9.17
s=tf('s');
sysG=1/(s^3+0.2*s^2+s);
sysH=123*(s^2+0.18*s+0.81)/(s^2+20*s+100);
sysL=sysG*sysH;
rlocus(sysL)
title('Figure 9.17: Root locus including compensation')
axis([-3 1 -1.5 1.5])
hold on
sysCL=feedback(sysG,sysH);
r=eig(sysCL);
plot(r,'*')
z=0:.1:.9;
wn= .5:.5:3; 
sgrid(z, wn)
hold off
