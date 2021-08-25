%  Figure 10.41      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_41.m is a script to create Figure 10.41, the step response of the
% attitude inner loop to a 2 degree step in pitch angle.
clf;
% the total inner loop system matrix is

Atq =[-0.0064    0.0263         0  -32.2000         0;
   -0.0941   -0.6240  761.1400 -196.2000         0;
   -0.0002   -0.0015   -4.4120  -12.4800         0;
         0         0    1.0000         0         0;
         0   -1.0000         0  830.0000         0]; 

B =[0;
  -32.7000;
   -2.0800;
         0;
         0];
C = [0     0    -1     0     0];
D =0;
% now remove the altitude to get the inner loop pitch angle
At=Atq(1:4,1:4)
Bt=B(1:4);
Ct=[0 0 0 1];
% compute the dc gain
dcgain= -Ct*inv(At)*Bt
% compute the reference input in radians from 2 degrees

r=2*pi/180
t=0:.1:8;
y=step(At,r*Bt/dcgain,Ct,0,1,t);
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('\theta (t) (rad)');
title(' Fig. 10.41: Step response of the pitch angle inner loop ');
grid
