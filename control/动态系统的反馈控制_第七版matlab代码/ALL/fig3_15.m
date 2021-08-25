
%  Figure 3.15     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig3_15.m 
clf;
s=tf('s');
sys=(2*s+1)/(s^2+3*s+2);
pzmap(sys)
grid 
