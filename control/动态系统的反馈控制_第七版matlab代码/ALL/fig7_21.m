%  Figure 7.21      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate fig. 7.21.
clf;
s=tf('s');
sys=1/s^4;
rlocus(sys);
title('Fig. 7.21: Symmetric root locus for satellite system')
grid;
 