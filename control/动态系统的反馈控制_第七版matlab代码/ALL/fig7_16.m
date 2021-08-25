%  Figure 7.16      Feedback Control of Dynamic Systems, 7e
%                         Franklin, Powell, Emami
% 
%
% script to generate Fig. 7.16
% fig7_16.m                                           
%
clf;
A=[0 1;-1 0];
B=[0;1];
C=[1 0];
K=[3 4];
Acl=A-B*K;
Bcl=[4*B [1;0]];
Ccl=[C;[0 1]; -K/4];
Dcl=[0 0;0 0; 1 0];
t=0:.1:7;
sysCL=ss(Acl,Bcl,Ccl,Dcl);
[y,t]=step(sysCL,t);
plot(t,y(:,:,1),'LineWidth',2);
xlabel('Time (sec)');
ylabel('Amplitude');
text(1.5,.9,'x_1');
text(1.6,.3,'x_2');
text(1.5,.05,'u/4');
text(6.5,.3,'u_{ss}');
text(6.5,.95,'x_{ss}');
title('Fig. 7.16: Step response of the oscillator to a reference input');
grid;

