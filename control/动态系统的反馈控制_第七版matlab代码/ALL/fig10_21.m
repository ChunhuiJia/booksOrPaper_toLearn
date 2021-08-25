%  Figure 10.21      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%   fig10_21.m is a script to generate Fig 10.21, the     
%   frequency response of the LQR symmetric rootlocus compensator for the 
%   satellite position control, non-colocated case WITH ESTIMATOR

m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4];
[A,B,C,D] = twomass(m,k,d);
S=[A, B;C, D];r=[0*B;1]; N=S\r;Nx=N(1:4);Nu=N(5);
[A1,B,C,D] = twomass(m,k1,d);
a=[A, 0*A;
-C'*C, -A'];
b=[B;0*B];
c=[0*C, B'];
d=[0];

hold off; clf

P=eig(a-b*c*0.1621);
pc=P(real(P<0)==1);
K=place(A,B,pc);
Nbar=Nu+K*Nx;
% eig(a-b*K) 
P=eig(a-b*c*3.056e7);
pe=P(real(P<0)==1);
L=place(A',C',pe)';
Ac=A-B*K-L*C ;Bc=L;Cc=K;Dc=0;
%
w=logspace(-1,1);
w(26) = 1; w(25) = .94;w(25)=.9;
sysC=ss(Ac,Bc,Cc,Dc);
[mag, ph]=bode(sysC,w);
subplot(211); loglog(w,squeeze(mag),'LineWidth',2); grid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude, |D_4(j\omega)|');
title('Fig. 10.21: Bode plot of the optimal compensator D_4(s)');
subplot(212); semilogx(w,squeeze(ph),'LineWidth',2);grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');

%Bode grid
bodegrid