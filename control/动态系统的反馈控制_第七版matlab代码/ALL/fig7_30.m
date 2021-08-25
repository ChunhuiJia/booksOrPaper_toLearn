%  Figure 7.30      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.30
% fig7_30.m
clf;
A=[0 1;-1 0]; 
B=[0;1];
C=[1 0];
K=[3 4];
Acl=A-B*K;
Bcl=[4*B [1;0]];
Ccl=[C;[0 1]; -K/4];
Dcl=[0 0;0 0; 1 0];
L=[20;99];
A=[Acl, 0*Acl;L*C-B*K, A-L*C];
B=[0 1;4 0;0 0;4 0];
C=eye(4);
D=[0 0;0 0;0 0;0 0];
t=0:.03:4;
sys=ss(A,B,C,D);
[y]=impulse(sys,t);
plot(t,y(:,:,2),'LineWidth',2);
xlabel('Time (sec)');
ylabel('Amplitude');
text(.25,2,'$$\mathsf{\hat x_2}$$','interpreter','latex','FontSize',10);
text(.5,1,'$$\mathsf{\hat x_1}$$','interpreter','latex');
text(.15,.8,'x_1');
text(.25,-.5,'x_2');
title('Fig.7.30: Initial condition response of oscillator with estimator')
grid;