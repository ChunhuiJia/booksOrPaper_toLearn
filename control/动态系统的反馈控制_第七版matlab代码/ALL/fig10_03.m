%  Figure 10.03     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_03.m is a script to generate Fig. 10.3  
%  the rootlocus of the uncompensated satellite 
%  position control, non-colocated case

clf; 
% satellite system matrices
A=[0    1.0000         0         0;
   -0.9100   -0.0360    0.9100    0.0360;
         0         0         0    1.0000 ;
    0.0910    0.0036   -0.0910   -0.0036];
B =[0;
     0;
     0;
     1];

C =[1     0     0     0];

D =[0];

% convert to numerator-denominator form
[np,dp]=ss2tf(A,B,C,D,1);
% remove leading zeros in numerator 
np=np(4:5);
hold off; clf
% rootlocus
rlocus(np,dp)
v=[-2 2 -1.5 1.5];axis(v); 
grid;
title('Fig.10.3: Root locus for satellite')
%
