%  Figure 7.26      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig7_26.m
% Script to plot the step position responses of the tape
% drive servo for LQR designs             
% 
clf; 

A =[0    2.0000         0         0         0;
   -0.1000   -0.3500    0.1000    0.1000    0.7500;
         0         0         0    2.0000         0 ;
    0.4000    0.4000   -0.4000   -1.4000         0  ;
         0   -0.0300         0         0   -1.0000   ];

B =[0;
     0;
     0 ;
     0  ;
     1   ];
C3 =[0.5000         0    0.5000         0         0];
Ct =[-0.2000   -0.2000    0.2000    0.2000         0];

D=[0];

S=[A B;C3 D];
r=[0 0 0 0 0 1]';
N=S\r
Nu=N(6);
Nx=N(1:5)

t=0:.2:12;
rho=1;
Klqr=lqr(A,B,rho*C3'*C3,1)

%klqr =[0.6526    2.1667    0.3474    0.5976    1.0616];

Alqrcl=A-B*Klqr;
Nbarlqr = Klqr*Nx+Nu;

sys=ss(Alqrcl,B*Nbarlqr,C3,D);

[ylqr]=step(sys,t);
figure(1)
plot(t,[ylqr],'LineWidth',2);
title('Fig. 7.26(a): Step responses of tape servo designs')
xlabel('Time (msec)');
ylabel('Tape position, x_3');
grid
hold on;

rho=10;
Klqr2=lqr(A,B,rho*C3'*C3,1)

Alqrcl2=A-B*Klqr2;
Nbarlqr2 = Klqr2*Nx+Nu;

sys2=ss(Alqrcl2,B*Nbarlqr2,C3,D);

[ylqr2]=step(sys2,t);

plot(t,[ylqr ylqr2])

hold on;

rho=0.1;
Klqr3=lqr(A,B,rho*C3'*C3,1)

Alqrcl3=A-B*Klqr3;
Nbarlqr3 = Klqr3*Nx+Nu;

sys3=ss(Alqrcl3,B*Nbarlqr3,C3,D);

[ylqr3]=step(sys3,t);

plot(t,ylqr,t,ylqr2,t,ylqr3,'--','LineWidth',2);
text(2.1,.7,'\rho=10');
text(3.3,.7,'\rho=1');
text(5,.7,'\rho=0.1');
nicegrid
hold off;

pause;

% Tension Responses

syst=ss(Alqrcl,B*Nbarlqr,Ct,D);

yTlqr=step(syst,t);

syst2=ss(Alqrcl2,B*Nbarlqr,Ct,D);

yTlqr2=step(syst2,t);

syst3=ss(Alqrcl3,B*Nbarlqr,Ct,D);

yTlqr3=step(syst3,t);

figure(2)
plot(t,yTlqr,t,yTlqr2,t,yTlqr3,'--','LineWidth',2);
title('Fig. 26(b): Tension plots for tape servo step responses')
xlabel('Time (msec)');
ylabel('Tape tension, T');
text(3,-0.025,'\rho = 10');
text(4,-0.05,'\rho = 1');
text(6,-.1,'\rho = 0.1');
grid;


