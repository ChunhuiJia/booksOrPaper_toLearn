% Fig. 9.12  Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Fig. 9.12
% using the general simulation nonlin
N=1; 
a=2;
r=0;
s=tf('s');
sys=(s^2+2*s+1)/s^3;
rlocus(num,den)
axis([-6 2 -3 3])
title('Root locus for the system of Figure 9.12')
z=0:.1:.9;
wn= 1:6;
sgrid(z, wn)
hold off
