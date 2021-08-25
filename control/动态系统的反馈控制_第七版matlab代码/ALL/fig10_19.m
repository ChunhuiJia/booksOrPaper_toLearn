%  Figure 10.19      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_19.m is a script to generate Fig 10.19 the transient  
%  response of the LQR symmetric rootlocus compensator of the 
%  satellite position control, non-colocated case

m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4];
[A,B,C,D] = twomass(m,k,d);

% Compute Nu, Nx
S=[A, B;C, 0];
r=[0*B;1]; 
N=S\r;
Nx=N(1:4);
Nu=N(5);

% call function
[A1,B,C,D] = twomass(m,k1,d);
Asrl=[A, 0*A;
-C'*C, -A'];
Bsrl=[B;0*B]; 
Csrl=[0*C, B'];
Dsrl=[0];

hold off; clf
%subplot(221); 
rlocus(Asrl,Bsrl,Csrl,Dsrl);
grid;
v=[-2 2 -1.5 1.5];
axis(v);
title('Symmetric root 
locus for the satellite') 
disp('select poles at -0.5+j0.36')
pause
[K, P]=rlocfind(Asrl,Bsrl,Csrl,Dsrl);
pc=P(real(P<0)==1);
K=place(A,B,pc);
Nbar=Nu+K*Nx;
eig(A-B*K)
t=0:.25:20;  
sys1=ss(A-B*K,Nbar*B,C,D);
sys2=ss(A1-B*K,Nbar*B,C,D);

step(sys1,t); hold on; step(sys2,t);

text(6,1.15,'Nominal');
text(4.5,0.7,'Stiff spring');
title('Fig. 10.19:Closed-loop step response for SRL design with state feedback')
grid

