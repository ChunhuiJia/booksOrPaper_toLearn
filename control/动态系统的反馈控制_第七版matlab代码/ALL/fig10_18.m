%  Figure 10.18      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_18.m is a script to generate Fig 10.18,     
%  the symmetric  rootlocus for the LQR symmetric rootlocus 
%  compensator of the satellite position control, non-collocated case

% parameter values
m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4];
% call model
[A,B,C,D] = twomass(m,k,d);
S=[A, B;C, D];r=[0*B;1]; N=S\r;Nx=N(1:4);Nu=N(5);
% call model
[A1,B,C,D] = twomass(m,k1,d);
% Form G(s)G(-s) in state-space 
Asrl=[A, 0*A;
-C'*C, -A'];
Bsrl=[B;0*B];
Csrl=[0*C, B'];
Dsrl=[0];

hold off; clf;
sysGG=ss(Asrl,Bsrl,Csrl,Dsrl); 
rlocus(sysGG);
grid;
v=[-2 2 -1.5 1.5];axis(v); 
title('Fig. 10.18: Symmetric rootlocus for the satellite') 
