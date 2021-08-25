%  Figure 10.45      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_46.m is a script to generate Fig. 10.46 the step response for the SRL
% design for the aircraft with state feedback augmenting the
% inner loop stabilization. Control effort plot.
clf;
A =[-0.00643    0.0263         0    -32.2000      0; 
   -0.0941     -0.6240       820      0         0;
   -0.000222   -0.00153     -0.668    0         0;
     0         0             1.000    0         0;
     0         -1.0000       0       830         0];
B=[0; -32.7; -2.08; 0; 0];
C=[0 0 0 0 1];
D=0;
K=[-.0011 .0016 -.0833 -1.613 -.0010];
t=0:.3:30;
Kq=[0 0 -1 0 0];
Ktq=[0 0 -.8 -6 0];
Cc=-K; % we plot the outer-loop control effort
Ac=A-B*(K+Kq+Ktq); % the feedback includes the inner compensation
Nbar = -K(5);  % since there is integral control, we can compute Nbar from K
r=-100*Nbar;  % 100 foot step  up is negative
Dc=r;
y=step(Ac,B*r,C,D,1,t);
u=step(Ac,B*r,Cc,Dc,1,t);
plot(t,u*180/pi,'LineWidth',2) % plot the control in degrees
title( 'Fig. 10.45: Outer-loop control for altitude step');
xlabel(' Time (sec)');
ylabel('\delta_e (deg)');
grid
