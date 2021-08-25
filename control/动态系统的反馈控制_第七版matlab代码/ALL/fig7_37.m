%  Figure 7.37      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. 7.37 
clf;
s=tf('s');
sysP=1/s^2;
sysC=40.4*(s+0.619)/(s^2+6.42*s+33.057);
w = logspace(-1,2);
[mag1,ph1] = bode(sysP,w);
[mag2,ph2]=bode(sysP*sysC,w);
subplot(211), loglog(w,squeeze(mag1),'--',w,squeeze(mag2),'LineWidth',2);
xlabel('\omega (rad/sec)');
ylabel('Magnitude');
title(' Fig.7.37: Bode plot for the combined control and estimator');
bodegrid;
subplot(212) , semilogx(w,squeeze(ph1),'--',w,squeeze(ph2),'LineWidth',2);
legend('Unompensated','Compensated');
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
%Bode grid
bodegrid
