%  Figure 3.33      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.33
% Pole-zero effects
%
close all;
clear all;
s=tf('s');
Den=(s^2+0.2*s+1.01)*(s+1); 
alpha=0.1;
beta=1.0;
sys=(1.01*1.0/(alpha^2+beta^2))*(s^2+2*alpha*s+alpha^2+beta^2)/Den;
alpha1=0.25;
alpha2=0.5;
pzmap(sys)
hold on;
plot(-alpha1,1.0,'o');
plot(-alpha1,-1.0,'o');
plot(-alpha2,-1.0,'o');
plot(-alpha2,1.0,'o');
axis([-1.5 0.5 -1.5 1.5]);
grid;




