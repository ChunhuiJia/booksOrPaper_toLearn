%  Figure 10.27      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_27.m is a script to generate Fig. 10.27, the      
%  step response of the collocated
%  design for the satellite with PD compensation
clf;
m=[1, .1]; k0=[0, .091] ; d0=[0, .0036]; k1=[0, .4];
[A,B,C,D]=twomass(m,k0,d0); [A1,B,C,D] = twomass(m,k1,d0);
C1=[0, 0, 1, 0];
 
nc1=0.25*[2, 1];
dc1=[1/40, 1];

[ac,bc,cc,dc]=tf2ss(nc1, dc1);
[aol,bol,col,dol]= series(ac, bc,cc,dc,A,B,C1,D);
[acl]=aol-bol*col;
ccl2=[0*cc C]
[aol1,bol1,col1,dol1] = series(ac,bc,cc,dc,A1,B,C1,D);
acl1=aol1-bol1*col1;
t=0:.3:50;
sys1=ss(acl,bol,col,dol);
step(sys1,t);
hold on; 
sys2=ss(acl1,bol1,col1,dol1);
step(sys2,t);
title('Closed-loop step response for D_{c5}(s)G_{co}(s).')
grid

