%  Figure 7.13      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig7_13.m is a script to generate Figure 7.13 

% Impulse response
clf;
A=[0 1;-1 0];
B=[0;1];
C=[1 0];
K=[3 4];
Acl=A-B*K;
Bcl=[4*B [1;0]];
Ccl=[C;[0 1]; -K/4];
Dcl=[0 0;0 0; 1 0];
sysCL=ss(Acl,Bcl,Ccl,Dcl);
t=0:0.1:7;
y=impulse(sysCL,t);
plot(t,y(:,:,2),'LineWidth',2);
xlabel('Time (sec)');
ylabel('Amplitude');
text(1.7,-.3,'x_2');
text(.5,.1,'u/4'); 
text(.7,.7,'x_1');
title('Fig. 7.13: Impulse response of the oscillator with full state feedback');
grid;

