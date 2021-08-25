%  Figure 7.20      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate fig. 7.20.
clf;
s=tf('s');
sys=-1/(s^2-1);
rlocus(sys);
title('Fig. 7.20: Symmetric root locus for a first-order system')
grid; 
