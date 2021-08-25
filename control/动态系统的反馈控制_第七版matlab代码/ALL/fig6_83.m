% Fig. 6.42   Feedback Control of Dynamic Systems, 7e 
% Fig. 6.83            Franklin, Powell, Emami
%

clear all;
%close all;
clf

figure(1)
num=85*conv([1 1],[1 2 43.25]);
p=conv([1 2 82],[1 2 101]);
den=conv([1 0 0],p);
w=logspace(-1,2,1000);
[mag,phas]=bode(num,den,w);
figure(1)
loglog(w,mag,w,ones(size(w)));
axis([.1 100 .01 10])
grid;
xlabel('\omega (rad/sec)');
ylabel('magnitude');
title('Fig. 6.42 : Bode plot for Example 6.13 (a) magnitude');
%pause;
figure(2)
semilogx(w,phas,w,-180*ones(size(w)));
grid;
xlabel('\omega (rad/sec)');
ylabel('phase (deg)');
title('Fig. 6.42 : Bode plot for Example 6.13 (b) phase');

% actually, the GMs and PMs are slightly different for the system here
% than that described in the text, the differences arose from  
% roundoff because the initial design was done by hand.  The ideas
% are unchanged.

figure(3)
subplot(1,1,1)
sysG=tf(num,den);
nichols(sysG)
hold on
mag1=[0 0];
pha1=[-200 -40];
ph180=[-180 -180];
mag180=[-20 20];
phaM36=[-144 -144];
GMdb=20*log10(0.8)*[1  1];
plot(pha1,mag1,ph180,mag180,phaM36,mag180,pha1,GMdb,'-')
grid
axis([-200 -40 -20 20])
title('Fig. 6.83 Nichols Chart for Examples 6.13 and 6.27');