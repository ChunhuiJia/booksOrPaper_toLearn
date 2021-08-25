%  Figure 7.45      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script for Fig. 7.45   
%clf;
A=[-10 1 0;-16 0 1;0 0 0];
B=[0 0 10]';
C=[1 0 0];
D=0;
[np,dp]=ss2tf(A,B,C,D);
np=[0 0 0 10];
nc=94.5*conv([1 7.98],[1 2.52]);
d1=conv([1 4.28+6.42*j],[1 4.28-6.42*j]);
dc=conv(d1,[1 10.6]);
num=conv(np,nc);
den=conv(dp,dc); 
h1=figure;
sys=tf(num,den);
rlocus(sys);
axis([-12 2 -7 7]);
grid;
title('Fig.7.45: Root locus for SRL design of DC Servo system')
% now zoom in towards the origin
h3=axes('pos',[.1 .1 .35 .35]);
set(h1,'CurrentAxes',h3);
hold on;
rlocus(num,den);
grey = [0.8 0.8 0.8];
axis([-8.5 -7.2 -1 1]);


