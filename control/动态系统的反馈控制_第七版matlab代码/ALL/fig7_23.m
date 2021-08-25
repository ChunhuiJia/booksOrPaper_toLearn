%  Figure 7.23      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.23
% fig7_23.m
% Nyquist for LQR 
clf;
A=[0 1;0 0];
B=[0;1];
C=[1 0];
D=0;
R=1;
rho=1;
Q=rho*C'*C;
[K,S]=lqr(A,B,Q,R);
sys=ss(A,B,K,0);
% circle of radius one
plot(-1+sin(0:.1:2*pi),cos(0:.1:2*pi),'r--','LineWidth',2);
axis equal;
text(-1,0,'x');
hold on;
w=logspace(0,2);
nyquist(sys,w);
title('Fig. 7.23: Nyquist diagram');