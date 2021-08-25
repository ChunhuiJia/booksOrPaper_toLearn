%  Figure 10.35      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% Fig. 10.35  Script for computation of the yaw damper rootlocus
% with feedback through a washout circuit.

clf;
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
% Open-loop equations with washout
[Apw,Bpw,Cpw,Dpw]=series(Ap,Bp,Cp,Dp,Aw,Bw,Cw,Dw);
 % the washout compensated root locus
hold off; clf
axis([-11, 1, -4.5, 4.5]);  
rlocus(Apw,Bpw,-Cpw,-Dpw)
title('Fig. 9.35: Root locus for A/C with washout')
grid;
