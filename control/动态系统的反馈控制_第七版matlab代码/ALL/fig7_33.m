%  Figure 7.33      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.33
% fig7_33.m  
clf;
A=[0 1;-1 0]; 
B=[0;1];
C=[1 0];
K=[3 4];
Acl=A-B*K;
Bcl=[4*B [1;0]];
Ccl=[C;[0 1]; -K/4];
jc=[0 0;0 0; 1 0];
Acl=[Acl [0;0]; -101*C-K -10];
Bcl=[0 1;4 0;4 0];
Ccl=eye(3);
Ccl(3,1) = 10;
Dcl=[0 0;0 0;0 0];
t=0:0.1:4;
syscl2=ss(Acl,Bcl(:,2),Ccl,Dcl(:,2));
[y]=impulse(syscl2,t);
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Amplitude');
text(.2,3,'$$\mathsf{\hat x_2}$$','interpreter','latex','FontSize',11);
text(.75,1,'x_1');
text(.25,-1,'x_2');
title('Fig.7.33: Initial condition response with reduced order estimator')
grid

