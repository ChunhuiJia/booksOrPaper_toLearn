%  Figure 10.33      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% Fig. 10.33 Script for computation of the  frequency response of yaw 
% control. Aircraft Bode plot. 
clf;
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

% the uncompensated frequency response;

w= logspace(-1, 1);

[magp ,php]=bode(Ap,-Bp,Cp,Dp,1,w);
magp1=[magp, ones(size(magp))];
subplot(211); 
loglog(w,magp1,'LineWidth',2); 
grid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude, |G(s)|');
title('Fig. 10.33:Frequency response of the yaw damper with direct feedback');
php1=[php,  -180*ones(size(php))];
subplot(212); 
semilogx(w, php1,'LineWidth',2);
grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid
