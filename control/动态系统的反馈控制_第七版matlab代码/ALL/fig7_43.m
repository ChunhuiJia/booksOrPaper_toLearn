%  Figure 7.43      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. 7.43
% clf;
A=[-10 1 0;-16 0 1;0 0 0];
B=[0 0 10]';
C=[1 0 0];
D=0;
j=sqrt(-1);
sysP=ss(A,B,C,D);
nc=-20.93*conv([1 -0.735],[1 1.871]);
r=[-0.99+6.12*j -0.99-6.12*j];
dc=poly(r);
sysC=tf(nc,dc);
sysPC=sysP*sysC;
rlocus(sysPC);
axis([-9 4 -9 9])
title('Fig.7.43: Root locus for reduced-order DC Servo design')
grid;
 
