%  Figure 10.37      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%% Fig. 10.37  Script for computation of the yaw damper
%  impulse response with feedback through a washout circuit.

clear all;
close all; 
% the equations of the aircraft:

A =[-0.0558   -0.9968    0.0802    0.0415;
    0.5980   -0.1150   -0.0318         0 ;
   -3.0500    0.3880   -0.4650         0 ;
         0    0.0805    1.0000         0] ;
B =[0.0073;
   -0.4750;
    0.1530;
         0];
C = [0     1     0     0];
D =[0];
% the equations of the actuator:

na=[0 10];
da=[1 10];
[Aa,Ba,Ca,Da]=tf2ss(na,da);

% the equations of the aircraft with actuator:

[Ap,Bp,Cp,Dp]=series(Aa,Ba,Ca,Da,A,B,C,D);
% the washout circuit
nw=[1 0];dw=[1 1/3];
[Aw,Bw,Cw,Dw]=tf2ss(nw,dw);
%  Open-loop equations with washout
[Apw,Bpw,Cpw,Dpw]=series(Ap,Bp,Cp,Dp,Aw,Bw,Cw,Dw);
 % the washout compensated root locus
 hold off; clf
% 
%
%
figure(1)
% the closed-loop system with washout feedback
[ac,bc,cc,dc]= feedback(Ap,Bp,Cp,Dp,Aw,Bw,-2.62*Cw,-2.62*Dw);
% impulse response of the yaw-rate system
bc1=[1 0 0 0 0 0]';   % input to put initial condition on beta
t=0:.2:30;
[yol]=impulse(A,[1 0 0 0]',[1 0 0 0],D,1,t); hold on
plot(t,yol,'-','LineWidth',2);
text(8,0.7,'No feedback')
title('Fig 10.37: Initial condition response')
[ywo]=impulse(ac,bc1, [ 1     0     0     0     0     0],dc,1,t); 
plot(t,ywo,'--','LineWidth',2);
text(14,-0.1,'Yaw rate feedback');
grid;
hold on


% desired closed-loop poles   
p=[-.0051 -.468 -1.106 -9.89 -.279+i*.628 -.279-i*.628]'; 
K=place(Apw,Bpw,p);
pe=5*p;  % estimator poles
L=place(Apw',Cpw',pe)';
ae=Apw-Bpw*K-L*Cpw;
be=L;
ce =K;
de=0;

[Ac, Bc, Cc, Dc]=feedback(Apw,Bpw,Cpw,Dpw,ae,be,ce,de);
Bc1=[0 1 0 0 0 0 0 0 0 0 0 0]';
Cc1=[0 1 0 0 0 0 0 0 0 0 0 0];  % note beta output!

% impulse response of the yaw-rate system with LQR feedback

[ylqr]=impulse(Ac,Bc1,Cc1,Dc,1,t); 
plot(t,ylqr,'-.','LineWidth',2)
text(6.5,-0.2,'SRL')
xlabel('Time (sec)');
ylabel('\beta (deg)');
%grid
nicegrid




