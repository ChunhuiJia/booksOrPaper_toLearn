%  Figure 10.36      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  Fig. 10.36  Script for computation of the yaw damper Bode plot 
%  for feedback through a washout circuit.


% the equations of the aircraft:

A =[-0.0558   -0.9968    0.0802    0.0415;
    0.5980   -0.1150   -0.0318         0 ;
   -3.0500    0.3880   -0.4650         0 ;
         0    0.0805    1.0000         0] ;
B =[0.0073;
   -0.4750;
    0.1530;
         0]; 
C = [0     1     0     0];
D =[0];
% the equations of the actuator:

na=[0 10];
da=[1 10];
[Aa,Ba,Ca,Da]=tf2ss(na,da);

% the equations of the aircraft with actuator:

[Ap,Bp,Cp,Dp]=series(Aa,Ba,Ca,Da,A,B,C,D);
% the washout circuit
nw=[1 0];dw=[1 1/3];
[Aw,Bw,Cw,Dw]=tf2ss(nw,dw);
%  Open-loop equations with washout
sysw=ss(Aw,Bw,Cw,Dw);
sysp=ss(Ap,Bp,Cp,Dp);
syspw=series(sysp,sysw)
[Apw,Bpw,Cpw,Dpw]=ssdata(syspw);
 % the washout compensated root locus
 hold off; clf
w=logspace(-1,1);
syspw1=ss(Apw,Bpw,-Cpw,-Dpw);
[mag, ph]=bode(syspw1,w);
subplot(211); loglog(w,mag(:,:),'LineWidth',2); grid; hold on;
xlabel('\omega (rad/sec)');
ylabel('Magnitude');
loglog(w,ones(size(mag(:,:))),'g','LineWidth',2);
title('Fig. 10.36: Bode plot for rate-feedback with washout')
ph1 = [ph(:,:); -180*ones(size(ph(:,:)))];
subplot(212); semilogx(w,ph1,'LineWidth',2); grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid

