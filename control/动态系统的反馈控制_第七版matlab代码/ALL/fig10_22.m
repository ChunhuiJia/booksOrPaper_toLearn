%  Figure 10.22      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%   fig10_22.m is a script to generate Fig 10.22,      
%   frequency response of the LQR symmetric rootlocus compensator of the 
%   satellite position control, non-colocated case WITH ESTIMATOR

m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4];
[A,B,C,D] = twomass(m,k,d);
S=[A, B;C 0];r=[0*B;1]; N=S\r;Nx=N(1:4);Nu=N(5);
[A1,B,C,D] = twomass(m,k1,d);
% form the 2nx2n matrix of the lqr SRL system
a=[A, 0*A;
-C'*C, -A'];
b=[B;0*B];
c=[0*C, B'];
d=[0];
hold off; clf 
P=eig(a-b*c*0.1621);
% the optimal poles are those of the SRL in the left-half plane
pc=P(real(P<0)==1);
K=place(A,B,pc);
Nbar=Nu+K*Nx;
% 
P=eig(a-b*c*3.056e7);
pe=P(real(P<0)==1);
L=place(A',C',pe)';
ac=A-B*K-L*C ;bc=L;cc=K;dc=0;
[Aol,Bol,Col,Dol]=series(ac,bc,cc,dc,A,B,C,D);
w=logspace(-1,1);
w(26) = 1; w(25) = .94;
[mag, ph]=bode(Aol,Bol,Col,Dol,1,w);
subplot(211);
mag1=[mag, ones(size(mag))];
loglog(w,mag1,'LineWidth',2); grid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude, |D_{c4}(s)G(s)|');
title('Fig. 10.22: Frequency response for D_{c4}(s)G(s)')
subplot(212); 
ph1=[ph, -180*ones(size(ph))];
semilogx(w,ph1,'LineWidth',2);grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid
