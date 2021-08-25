%  Figure 4.17     Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
%% script to generate Figure 4.17
% case I, P control by reaction curve data.
% First, input the plant model and compute the reaction curve.
s=tf('s');
sysp=1/(600*s^2+70*s+1);
set(sysp,'InputDelay', 5) 
figure(1)
clf
t=0:0.1:400;
step(sysp,t)
title('Figure 4.17: Reaction Curve for the Heat Exchanger')
grid;
