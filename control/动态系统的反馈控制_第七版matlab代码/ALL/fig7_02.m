
% Fig. 7.2  Feedback Control of Dynamic Systems, 7e 
%            Franklin, Powell, Emami
% script to generate Fig. 7.2

clear all;
close all;

A = [0 1; 0 -0.05];
B = [0; 0.001];
C = [0 1];
D = 0;
sys=ss(A,500*B,C,D);
t=0:.01:100;
step(sys,t);
title('Fig. 7.2: Response of car velocity to a step in u');
grid;

