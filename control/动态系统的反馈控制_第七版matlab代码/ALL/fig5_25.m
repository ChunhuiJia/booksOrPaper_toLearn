% Fig. 5.25  Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script for Figure 5.25, Lead design.

clf
np=1;
dp=[1 1 0];
nc=[1 2];
dc=[1 10];
nol=conv(np,nc);
dol=conv(dp,dc);
ncl=70*[0 0 nol];
dcl=dol+ncl;
t=0:.01:1.8;
step(ncl,dcl,t)
grid on
title('Figure 5.25 Step response for lead design')
