% Fig. 6.2   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%

clear all;
%close all;
clf
num=[1 1];
den=[.1 1];
[mag,ph,w]=bode(num,den);
figure(1)
subplot(2,1,1),loglog(w,mag),grid
axis([.1 100 1 10])
title('Fig. 6.2 (a) Magnitude'),ylabel('Magnitude')
subplot(2,1,2),semilogx(w,ph),grid
axis([.1 100 0 60])
title('(b) Phase'),ylabel('\phi (deg)'),xlabel('\omega (rad/sec)')
