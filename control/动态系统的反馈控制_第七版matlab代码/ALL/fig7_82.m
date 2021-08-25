%  Figure 7.82      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% 
% script to generate Fig. 7.82 
% heat exchanger root locus 
clf;
np=1;
dp=conv([10 1],[60 1]);
j=sqrt(-1);
r=[-.14+.27*j -.14-.27*j]; 
dc=poly(r); 
nc=[1 1.8];
num=conv(np,nc);
den=conv(dp,dc);
rlocus(num,den)
axis([-.4 .4 -.3 .3])
title('Fig. 7.82: Root locus for the heat exchanger design')
grid;

