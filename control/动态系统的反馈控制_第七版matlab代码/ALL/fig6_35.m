% Fig. 6.35   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%

clear all;
%close all;
clf

num=1;
den=conv([1 0],[1 2 1]);
w=logspace(-1,1,100);
[m,p]=bode(num,den,w);
subplot(2,1,1),loglog(w,m,w,ones(size(w)),w,2*ones(size(w)));
grid;
ylabel('Magnitude');
title('Fig. 6.35 PM versus K from the frequency response data.');
subplot(2,1,2),semilogx(w,p,w,-180*ones(size(w)));
grid;
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');
