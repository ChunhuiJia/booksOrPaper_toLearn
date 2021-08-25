%  Figure 7.58   Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.58
% Robust Servo Example  
%% Example 7.35; Figure 7.58
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
% controller frequency response
sysC=ss(Ac,Bc,Cc,Dc);
w=logspace(-2,1,5000);
[mag, ph]=bode(sysC,w);
grid on;
subplot(211);
magdb=20*log10(mag);
semilogx(w,magdb(:),'LineWidth',2);
bodegrid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude (db)');
title('Fig. 7.58: Controller frequency response');
subplot(212);
semilogx(w,ph(:)-360*ones(size(ph(:))),'LineWidth',2);
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid