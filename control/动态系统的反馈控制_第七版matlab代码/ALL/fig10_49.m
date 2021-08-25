%  Figure 10.49      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_49.m is a script to generate Fig. 10.50, the Bode plots  
%  for the fuel/air ratio with a linear sensor.  A (3,3)
%  Pade approximant is used  to approximate the delay.

% construct the F/A dynamics with the sensor time-constant too
A =[-50     0     0;
     0    -1     0;
    10    10   -10]; 

B =[25.0000;
    0.5000;
         0];
C =[0     0     1];
D=0;
[n3,d3]=pade(0.2,3); %  the delay Pade model

[np,dp]=ss2tf(A,B,C,D); % convert to polynomial form

np=[np(3:4)]  % remove the extraneous zeros

np=conv(np,n3);  % the plant numerator
dp =conv(dp,d3);  % the plant denominator
nc=[1 .3];
dc=[1 0]; % the PI controller in polynomial form
% form the open-loop system
nol=conv(np,nc);
dol=conv(dp,dc);
w=logspace(-1,2);
sys=tf(nol,dol);
[mag,ph]=bode(sys,w);
hold off; 
clf;
subplot(211); 
mag1=[mag; ones(size(mag))];
loglog(w,mag1(:,:),'LineWidth',2);
xlabel('\omega (rad/sec)');
ylabel('Magnitude |D_cG|');
title('Fig. 10.49: Bode plot for the fuel/air control')
grid;
% prtsc
subplot(212);
ph1=[ph; -180*ones(size(ph))];
semilogx(w,ph1(:,:),'LineWidth',2);
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
grid;
%Bode grid
bodegrid
% 
[Gm,Pm,Wcg,Wcp] = margin(mag,ph,w) 

