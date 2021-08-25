%  Figure 7.44      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. 7.44
clf;
A=[-10 1 0;-16 0 1;0 0 0];
B=[0 0 10]';
C=[1 0 0];
D=0;
Asrl=[-A' -C'*C;0*A A];
Bsrl=[0*B;B];
Csrl=[B' 0*B'];
Dsrl=0;
syssrl=ss(Asrl,Bsrl,Csrl,Dsrl);
rlocus(syssrl)
axis([-12, 12, -6, 6]);
grid; 
title('Fig.7.44: Symmetric root locus for a DC Servo system')
