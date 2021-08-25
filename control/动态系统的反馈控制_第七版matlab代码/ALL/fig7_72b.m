%  Figure 7.72     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% 
% script to generate Fig. 7.72(b)             
%  
clf;
A=-3;
B=1;
C=1;
D=0;
K=2;
L1=225;
L2=27;
Acl=[A,-K,-1;L2,A-K-L2,0;L1,-L1,0];
Bcl=[0 1;-L2 0;-L1 0];
Ccl=eye(3);
Dcl=0*ones(3,2);
t=0:.01:2;
uu=ones(size(t));
uu=[uu;uu]; 
uu(2,1:51)=0*ones(1,51);
syscl=ss(Acl,Bcl,Ccl,Dcl);
y=lsim(syscl,uu,t);
plot(t,y,'LineWidth',2);
text(0.5,1.3,'y');
text(0.5,-.5,'$$\mathsf{\hat x}$$','interpreter','latex','FontSize',10,'FontName','Helvetica');
text(0.5,-2.8,'$$\mathsf{\hat \rho}$$','interpreter','latex');
title('Figure 7.72 (b): Command step response and disturbance step response');
xlabel('Time (sec)');
ylabel('y, $$\mathsf{\hat x}, \mathsf{\hat \rho}$$','interpreter','latex','FontSize',10,'FontName','Helvetica');
grid;

