%  Figure 6.80      Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
% 

clear all
%close all;
clf

w=logspace(-2,2,100);
ff=180/pi;
ii=1:78;
semilogx(w(ii),-w(ii)*ff);
grid;
xlabel('\omega (rad/sec)');
ylabel('phase (deg)');
title('Fig. 6.80 Phase lag due to pure time delay.');