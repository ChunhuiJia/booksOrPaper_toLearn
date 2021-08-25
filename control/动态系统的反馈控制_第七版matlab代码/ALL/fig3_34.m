%  Figure 3.34      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.34
% Pole-zero effects
%
close all; 
clear all;s=tf('s');
Den=(s^2+0.2*s+1.01)*(s+1);
alpha1=0.1;
beta=1.0;
sys1=(1.01*1.0/(alpha1^2+beta^2))*(s^2+2*alpha1*s+alpha1^2+beta^2)/Den;

t=0:.1:20;
[y1]=step(sys1,t)

alpha2=0.25;
beta=1.0;
sys2=(1.01*1.0/(alpha2^2+beta^2))*(s^2+2*alpha2*s+alpha2^2+beta^2)/Den;
[y2]=step(sys2,t)


alpha3=0.5;
beta=1.0;
sys3=(1.01*1.0/(alpha3^2+beta^2))*(s^2+2*alpha3*s+alpha3^2+beta^2)/Den;

[y3]=step(sys3,t)
plot(t,y1,t,y2,t,y3,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Unit-step response');
text(2, 1.36, '\alpha = 0.5');
text(2,1.14,'\alpha = 0.25');
text(2,0.8,'\alpha = 0.1');
title('Fig. 3.34: Step responses');
grid





