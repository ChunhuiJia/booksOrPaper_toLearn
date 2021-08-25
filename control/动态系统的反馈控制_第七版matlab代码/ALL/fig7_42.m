%  Figure 7.42      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.42
% fig7_42.m   
clf;
A=[-10 1 0;-16 0 1;0 0 0];
B=[0 0 10]';
C=[1 0 0];
D=0;
[np,dp]=ss2tf(A,B,C,D);
np=[0 0 0 10];
num = [0 0 0 10];
nc=conv([1 .432],[1 2.1]);
j=sqrt(-1);
r=[-2.94+8.32*j -2.94-8.32*j];
d1=poly(r);
dc=conv(d1,[1 -1.88]);
num=conv(np,nc);
den=conv(dp,dc);
rlocus(num,den)
axis([-9 3 -9 9]);
grid; 
title('Fig.7.42: Root locus for DC Servo pole assignment design')
