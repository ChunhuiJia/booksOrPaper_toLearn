%  Figure 10.24      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%   fig10_24.m is a script to generate Fig. 10.24,   
%   the transient response of the LQR symmetric rootlocus compensator 
%   of the satellite position control, non-colocated case WITH ESTIMATOR

% parameter values
m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4]; 
% call function
[A,B,C,D] = twomass(m,k,d);
s=[A, B;C, 0];r=[0*B;1]; N=s\r;Nx=N(1:4);Nu=N(5);
% call function
[A1,B,C,D] = twomass(m,k1,d);

% form G(s)G(-s) model
a=[A, 0*A;
-C'*C, -A'];
b=[B;0*B];
d=[0];
c=[0*C, B'];
hold off; clf
P=eig(a-b*c*0.1621);
pc=P(real(P<0)==1);
K=place(A,B,pc);
Nbar=Nu+K*Nx;
% eig(A-B*K)
P=eig(a-b*c*3.056e7);
pe=P(real(P<0)==1);
L=place(A',C',pe)';
ac=A-B*K-L*C ;bc=L;cc=K;dc=0;
[Aol,Bol,Col,Dol]=series(ac,bc,cc,dc,A,B,C,D);
[acl,bcl,ccl,dcl]=feedback(A,B,C,D,ac,bc,cc,dc);
[acl1,bcl,ccl,dcl]=feedback(A1,B,C,D,ac,bc,cc,dc);
bcl= Nbar*[B;B];
t=0:.25:30;
syscl=ss(acl,bcl,ccl,dcl);
step(syscl,t); 
hold on; 
gtext('nominal case')
syscl1=ss(acl1,bcl,ccl,dcl);
step(syscl1,t) ;
gtext('stiff-spring case');
title('Fig. 10.24:Closed-loop step response for the SRL design with an estimator')
grid;


