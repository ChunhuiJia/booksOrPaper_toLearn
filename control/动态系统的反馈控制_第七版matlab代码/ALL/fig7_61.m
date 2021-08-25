%  Figure 7.61      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7. 61
% Robust Servo Example  
%% Example 7.35; Figure 7.61
clf;
clear all; 
A=[0 1; 0 -1];
B=[0;1];
C=[1 0];
D=[0];
omega=1;
As=[0 1 0 0;-omega*omega 0 1 0;0 0 0 1;0 0 0 -1];
Bs=[0;0;B];

% desired closed-loop poles
pc=[-1+sqrt(3)*j;-1-sqrt(3)*j;-sqrt(3)+j;-sqrt(3)-j];
K=acker(As,Bs,pc);

K1=K(:,1:2);
Ko=K(:,3:4);
% form controller matrices
Ac=[0 1;-omega*omega 0];
Bc=-[K(2);K(1)];;
Cc=[1 0];
Dc=[0];

% closed-loop system
Acl=[A-B*Ko B*Cc;Bc*C Ac];
Bcl=[0;0;-Bc];
Ccl=[C 0 0];
Dcl=[0];
syscl=ss(Acl,Bcl,Ccl,Dcl);
pole(syscl)
tzero(syscl)
% compute blocking zeros
Dcle=-1;
syse=ss(Acl,Bcl,Ccl,Dcle);
tzero(syse)
% Closed-loop response
t=0:.01:25;
r=sin(t);
y=lsim(syscl,r,t);
figure(1)
plot(t,y,t,r,'LineWidth',2);
text(0.5,0.8,'r');
text(1.5,.4,'y');
xlabel('Time (sec)');
ylabel('Reference, output');
title('Fig. 7.61(a): Tracking response');
grid;

%Control effort
Cclu=[-Ko Cc];
Dclu=[0];
sysclu=ss(Acl,Bcl,Cclu,Dclu);
u=lsim(sysclu,r,t);
figure(2)
plot(t,u,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Control, u');
title('Fig. 7.61(b): Control effort');
grid

% tracking error signal
Ccle=[-C 0 0];
Dcle=[1];
syscle=ss(Acl,Bcl,Ccle,Dcle);
e=lsim(syscle,r,t);
figure(3)
plot(t,e,'LineWidth',2);
xlabel('Time (sec)');
ylabel('Error signal, e');
title('Fig. 7.61(c): Tracking error');
grid;



