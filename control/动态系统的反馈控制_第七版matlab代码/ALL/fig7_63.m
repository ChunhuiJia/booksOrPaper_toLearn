%  Figure 7.63      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% Robust Servo Example 
%% Example 7.35; Figure 7.63
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
K=place(As,Bs,pc);

K1=K(:,1:2);
Ko=K(:,3:4);
% form controller matrices
Ac=[0 1;-omega*omega 0];
Bc=-[K(2);K(1)];
Cc=[1 0];
Dc=[0]; 

% closed-loop system
Acl=[A-B*Ko B*Cc;Bc*C Ac];
Bcl=[0;0;-Bc];
Ccl=[C 0 0];
Dcl=[0];
syscl=ss(Acl,Bcl,Ccl,Dcl);
pole(syscl)
tzero(syscl);
clf;

% Frequency response
w=logspace(-2,1);
[mag,ph]=bode(syscl,w);
magdb=20*log10(mag);
subplot(211);
mag1=[ones(size(mag))];
semilogx(w,magdb(:,:),'LineWidth',2);
hold on;
loglog(w,mag1(:,:),'g','LineWidth',2);
grid on;
xlabel('\omega (rad/sec)');
ylabel('Magnitude (db)');
title('Fig. 7.63: Closed-loop frequency response');
subplot(212);
ph1=[-180*ones(size(ph))];
semilogx(w,ph(:,:),'LineWidth',2);
hold on;
semilogx(w,ph1(:,:),'g','LineWidth',2);
grid on;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');

%Bode grid
bodegrid


