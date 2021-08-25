
%  Figure 7.68, 7.69, 70      Feedback Control of Dynamic Systems, 6e
%                        Franklin, Powell, Emami
% script to generate Fig. 7. 68, 69, 70
% Robust Servo Example  
%% Example 7.37; Figure 7.68, 7.69, 70
%clf;
clear all;
A=[0 1; 0 -1];
B=[0;1];
C=[1 0];
D=[0];
omega=1;
a=[0 1 0 0;-omega*omega 0 1 0;0 0 0 1;0 0 0 -1];
b=[0;0;B];

% desired closed-loop poles
pc=[-1+sqrt(3)*j;-1-sqrt(3)*j;-sqrt(3)+j;-sqrt(3)-j];
k=acker(a,b,pc);

% form controller matrices
k1=k(:,1:2);
ko=k(:,3:4);
ac=[0 1;-omega*omega 0];
bc=-[k(2);k(1)];;
cc=[1 0];
dc=[0];

% closed-loop system
acl=[A-B*ko B*cc;bc*C ac];
bcl=[0;0;-bc];
ccl=[C 0 0];
dcl=[0];
syscl=ss(acl,bcl,ccl,dcl);
pole(syscl)
tzero(syscl)
% blocking zeros
dcle=-1;
syse=ss(acl,bcl,ccl,dcle);
tzero(syse)
% Closed-loop response
t=0:.01:25;
r=sin(t);
y=lsim(syscl,r,t);
%figure(1)
%plot(t,y,t,r);
%text(0.5,0.8,'r');
%text(1.5,.4,'y');
%xlabel('Time (sec)');
%ylabel('Reference, output');
%title('Fig. 7.64 (a): Tracking response');
%nicegrid;

%Control effort
cclu=[-ko cc];
dclu=[0];
sysclu=ss(acl,bcl,cclu,dclu);
u=lsim(sysclu,r,t);
%figure(2)
%plot(t,u);
%xlabel('Time (sec)');
%ylabel('Control, u');
%title('Fig. 7.64 (b): Control effort');
%nicegrid

%error signal
ccle=[-C 0 0];
dcle=[1];
syscle=ss(acl,bcl,ccle,dcle);
e=lsim(syscle,r,t);
%figure(3)
%plot(t,e);
%xlabel('Time (sec)');
%ylabel('Error signal, e');
%title('Fig. 7.64 (c): Tracking error');
%nicegrid;

%Model-following

%Reference Model
Am=[0 1;-1 0];
Bm=[0;1];
Cm=[1 0];
Dm=[0];

%desired poles
pc=[-1+sqrt(-1)*sqrt(3);-1-sqrt(-1)*sqrt(3)];
K=place(A,B,pc);

% Model-following Design: Solve for M and N using Algorithm from Bryson
% (1994)
[n,m]=size(B);
[p,n]=size(C);
D=zeros(p,m);
[nm,nm]=size(Am);
aa=[kron(eye(nm),A)-kron(Am',eye(n)) kron(eye(nm),B); kron(eye(nm),C) kron(eye(nm),D)];
bb=[zeros(nm*n,1);Cm(:)];
xx=aa\bb;
M=reshape(xx(1:n*nm),n,nm)
N=reshape(xx(n*nm+1:end),p,nm)
%
AAm=[Am zeros(2,2);B*(N+K*M) A-B*K];
BBm=[Bm;zeros(2,1)];
CCm=[zeros(1,2) C ];
DDm=[0];
sysmf=ss(AAm,BBm,CCm,DDm);
% x0=[0;1;0;0];
t=0:.01:25;
%hold on;
[ymf,t]=impulse(sysmf,t);
%plot(t,ymf)

figure()
plot(t,r,'LineWidth',2)
hold on;
plot(t,y,'--','LineWidth',2)
hold on;
plot(t,ymf,'-.','LineWidth',2)
title('Figure 7.68: Nominal plant');
xlabel('Time (sec)');
ylabel('Reference, output');
text(0.5,0.8,'r');
text(1.5,.4,'$y_{\rm IM}$','interpreter','latex');
text(1.4,.79,'$y_{\rm MF}$','interpreter','latex')
grid;

figure()
plot(t,r'-ymf,'LineWidth',2)
title('Figure 7.69: Nominal plant');
hold on
plot(t,e,'--','LineWidth',2);
text(1.5,.55,'IM')
text(0.3,.08,'MF')
xlabel('Time (sec)');
ylabel('Error signal, e');
grid;

% Robustness: perturb A
Atilde=[0 1;0 -1.1];
A=Atilde;

% Internal model: perturbed plant
acl=[A-B*ko B*cc;bc*C ac];
bcl=[0;0;-bc];
ccl=[C 0 0];
dcl=[0];
sysclp=ss(acl,bcl,ccl,dcl);
dcle=-1;
syse=ss(acl,bcl,ccl,dcle);
% Closed-loop response
t=0:.01:25;
r=sin(t);
yp=lsim(sysclp,r,t);

%figure()

%plot(t,yp,t,r);
%text(0.5,0.8,'r');
%text(1.5,.4,'$y_{\rm IM}$','interpreter','latex');
%text(1.1,.75,'$y_{\rm MF}$','interpreter','latex');
%title('Figure 7.70: Perturbed plant');
%xlabel('Time (sec)');
%ylabel('Reference, output');
%nicegrid;
%hold on;

% Model-following: perturbed plant
AAm=[Am zeros(2,2);B*(N+K*M) A-B*K];
BBm=[Bm;zeros(2,1)];
CCm=[zeros(1,2) C];
DDm=[0];
sysmfp=ss(AAm,BBm,CCm,DDm);
%x0=[0;1;0;0];
t=0:.01:25;
%hold on;
[ymfp,t]=impulse(sysmfp,t)

%plot(t,ymfp)


figure()
plot(t,r'-ymfp,'LineWidth',2)
hold on
plot(t,r'-yp,'--','LineWidth',2);
text(1.5,.55,'IM')
text(0.4,.07,'MF')
title('Figure 7.70: Perturbed plant');
xlabel('Time (sec)');
ylabel('Error signal, e, for perturbed plant');
grid;
hold off;