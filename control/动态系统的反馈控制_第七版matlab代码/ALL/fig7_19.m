%  Figure 7.19      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% fig7_19.m
% script to plot the step tension responses of the tape
% drive servo with dominant second order, and LQR designs
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

D=0;

p2 =[-0.7070+0.7070*i;
  -0.7070-0.7070*i    ;
  -4.0000               ;
  -4.0000                ;
  -4.0000                 ];



p22 =p2/1.5;
K2=acker(A,B,p22);

K2 =[8.5123   20.3457   -1.4911   -7.8821    6.1927];

A2cl=A-B*K2;

S=[A B;C3 D];
r=[0 0 0 0 0 1]';
N=S\r
Nu=N(6);
Nx=N(1:5)
Nbar2=K2*Nx+Nu
t=0:.2:12;
% 
yT2=step(A2cl,B*Nbar2,Ct,D,1,t);

Klqr=lqr(A,B,C3'*C3,1)

Klqr =[0.6526    2.1667    0.3474    0.5976    1.0616];

Alqrcl=A-B*Klqr;
% 

Nbarlqr = Klqr*Nx+Nu;

%
yTlqr=step(Alqrcl,B*Nbarlqr,Ct,D,1,t);
% 
plot(t,yT2,t,yTlqr,'-.','LineWidth',2);
xlabel('Time (msec)');
ylabel('Tape Tension, T');
text(8,.01,'LQR');
text(5,-.01,'Dominant second-order');
title('Fig.7.19: Tension plots for tape servo step responses');
grid;

