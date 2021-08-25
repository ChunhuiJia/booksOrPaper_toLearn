%  Figure 7.25      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.25
% pendulum LQR
%
clf;
wo=1;
A=[0 1;wo*wo 0];
B=[0;-1];
Cz=[2 1];
D=[0]; 

R=1;
Q=Cz'*Cz;
K=lqr(A,B,Q,R);
eig(A-B*K)
%step response
C=[1 0];

aa=[A B;C D];
bb=[0;0;1];
xx=aa\bb;
Nx=xx(1:2,:);
Nu=xx(3,:);
Nbar=Nu+K*Nx;
Acl=A-B*K;
Bcl=B*Nbar;
sys=ss(Acl,Bcl,C,D);
[y,t]=step(sys);
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Position, x_1');
title('Fig. 7.25: Step response pendulum: LQR design');
grid;


