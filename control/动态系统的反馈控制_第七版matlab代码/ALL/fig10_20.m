%  Figure 10.20      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_20.m is a script to generate                       
%  Fig. 10.20,  frequency response of the LQR symmetric rootlocus 
%  compensator of the satellite position control, non-colocated case

m=[1, 0.1]; k=[0, 0.091] ; d=[0, 0.0036]; k1=[0, 0.4];
[A,B,C,D] = twomass(m,k,d);
S=[A,B;C,D];r=[0*B;1]; N=S\r;Nx=N(1:4);Nu=N(5);
[A1,B,C,D] = twomass(m,k1,d);
Aa=[A, 0*A;
-C'*C, -A'];
Bb=[B;0*B];
Cc=[0*C, B'];
Dd=[0];
hold off; clf
rlocus(Aa,Bb,Cc,Dd);
v=[-2, 2, -1.5, 1.5];axis(v);
title('Symmetric rootlocus for the satellite') 
disp('select poles at -.5+j0.36')
pause
[K, P]=rlocfind(Aa,Bb,Cc,Dd)
pc=P(real(P<0)==1);
K=place(A,B,pc); 
Nbar=Nu+K*Nx;
hold off;
w=logspace(-1,1);
w(26) = 1;
[mag, ph]=bode(A,B,K,D,1,w);
subplot(211); loglog(w,mag,'LineWidth',2); grid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude, |KX(j\omega)/U(j\omega)|');
title('Fig. 10.20:Frequency response of the SRL design from u to Kx')
subplot(212);
ph1=[ph, -180*ones(size(ph))];
semilogx(w,ph1,'LineWidth',2);
grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid
[Gm,Pm,Wcg,Wcp] = margin(mag,ph,w)