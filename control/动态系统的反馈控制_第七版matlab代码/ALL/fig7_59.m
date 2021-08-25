%  Figure 7.59      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.59
% Robust Servo Example    
%% Example 7.35; Figure 7.59
clf;
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
% form controller matrices
K1=K(:,1:2); 
Ko=K(:,3:4);
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

% Frequency response from r to e
syscle=ss(Acl,Bcl,Ccl,Dcle);
w=logspace(-1,2,500);
[mag, phas]=bode(syscle,w);
subplot(2,1,1);
magdb=20*log10(mag(:,:));
semilogx(w,magdb,'LineWidth',2);grid on;hold on;
xlabel('\omega (rad/sec)');
ylabel('Magnitude (db)');
title('Fig. 7.59: Frequency response, r to e');
subplot(2,1,2);
semilogx(w,phas(:,:),'LineWidth',2);
xlabel('\omega (rad/sec)');
ylabel('Phase(deg)');
grid on;
%Bode grid
bodegrid
