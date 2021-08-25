% Fig. 5.10   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami

clf
np=[1 1];
dp=[1 0 0];
rlocus(np,dp)
axis([-6 2 -3 3])
title('Root locus for Figure 5.10')
z=0:.1:.9;
 wn= .5:.5:3;
 sgrid(z, wn)
 hold off
