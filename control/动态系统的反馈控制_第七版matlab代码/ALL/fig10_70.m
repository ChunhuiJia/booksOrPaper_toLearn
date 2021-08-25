%  Figure 10.70      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_70.m is a script to generate Fig. 10.70 the linear RTP response 
% LQG method with internal model
% RTP chamber demo Example
clf;
A=[-0.068208813989939 0.014929776357245 0.000000065782442;...
   0.045809672136430 -0.118134773528570 0.021802006306129;...
   0.000000433637498 0.046839194867347 -0.100884399149872];
B3=[0.37873508304055 0.110575403544586 0.022912893467038;...
   0.000000002974222 0.449046982554739 0.073572900808161;...
   0.000000027324116 0.000702342292121 0.417797228783230];
C3=eye(3,3);
D3=0*eye(3,3);
sysp=ss(A,B3,C3,D3);
[eol]=eig(A); 
[zol]=tzero(sysp);
[zol22]=tzero(A,B3(:,2),C3(2,:),D3(2,2));
% Combine 3 lamps into a single actuator
B=B3(:,1)+B3(:,2)+B3(:,3);
% Select center temperature
C=C3(2,:);
As=[zeros(1,1) C;zeros(3,1) A];
Bs=[zeros(1,1);B];
%
% weight temperature derivative differences
Q1hat=[eye(1,1) zeros(1,3);0 2 -1 -1; 0 -1 2 -1; 0 -1 -1 2]+1e-6*eye(4,4);
Q1hat=diag([1 10 10 10])*Q1hat;
Q2hat=eye(1,1);
[K,Sric,ee]=lqr(As,Bs,Q1hat,Q2hat);
K1=K(1,1);
Ko=K(:,2:4);
Acl=[A-B*Ko B;-K1*C zeros(1,1)];
Bcl=[zeros(3,1);K1];
Ccl=[C zeros(1,1)];
Dcl=zeros(1,1);
[ecl]=eig(Acl);
[zcl]=tzero(Acl,Bcl,Ccl,Dcl);
% CL DC gain
[cldcgain]=Dcl-Ccl*inv(Acl)*Bcl;
%
% Estimator design
Qe=eye(1,1);
Re=0.001*eye(1,1);
[L,pp,el]=lqe(A,B,C,Qe,Re);
Ac=zeros(1,1);
Bc=-K1;
Cc=eye(1,1);
Dc=-Ko;
Acle=[A, B*Cc, -B*Ko;
   Bc*C, Ac, zeros(1,3);
   L*C, B*Cc, A-L*C-B*Ko];
Bcle=[zeros(3,1);-Bc;zeros(3,1)];
Ccle=[C, zeros(1,4)];
Dcle=zeros(1,1);
[ecle]=eig(Acle);
[zcle]=tzero(Acle,Bcle,Ccle,Dcle);
dcgain=Dcle-Ccle*inv(Acle)*Bcle;
t=0:.1:100;
R=[0:.1:25, 25*ones(1,500), 0*ones(1,250)];
R11=[R'];
R11=[R11 R11 R11 R11 R11 R11];
syscl=ss(Acle,Bcle,Ccle,Dcle);
[yy,t]=lsim(syscl,R,t);
figure(1);
plot(t,R11,'-','LineWidth',2);
grid on;
hold on;
plot(t,yy,'--','LineWidth',2);
xlabel('Time (sec)');
ylabel('Temperature (K)');
legend('r','y');
title('Fig. 10.70(a): Internal model controller, temperature tracking response');
%grid
h_axes = findobj(get(gcf,'Children'),'Type','axes');
grey = [0.7,0.7,0.7];
set(h_axes,'xcolor',grey,'ycolor',grey, ...
    'GridLineStyle','-','MinorGridLineStyle','-', ...
    'Units','pixels');
grid on 
c11=copyobj(h_axes,gcf); 
set(c11,'color','none','xcolor','k', ...
    'xgrid','off','ycolor','k', ...
    'ygrid','off'); 
%
%control effort
hold off;
Cclu=[zeros(1,3), eye(1,1), -Ko];
Dclu=zeros(1,1);
syscu=ss(Acle,Bcle,Cclu,Dclu);
[uuu,t]=lsim(syscu,R,t);
figure(2);
plot(t(1:753,:),uuu(1:753,:),'LineWidth',2);
hold on;
plot(t(752:818,:),0*ones(67,3),'LineWidth',2);
hold on;
plot(t(753:818,:),uuu(753:818,:),'--','LineWidth',2);
hold on;
plot(t(819:1001,:),uuu(819:1001,:),'LineWidth',2);
xlabel('Time (sec)');
ylabel('Lamp voltage');
title('Fig. 10.70(b): Internal model controller, control effort');
legend('u');
grid;








