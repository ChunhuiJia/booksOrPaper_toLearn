%  Figure 6.65      Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
% 

clear all
clf

k=10;
s=tf('s');
sysG=1/(s*(s+1));
sysD=(s/.1+1)/(s/.01+1);
sysT=feedback(k*sysD*sysG,1);
t=0:.1:25;
y=step(sysT,t);
subplot(2,1,1)
plot(t,y);
axis([0 25 0 1.4])
grid minor
xlabel('Time (sec)');
ylabel('y');
title('Fig. 6.65 Step response of lag-compensation designin Example 6.19.');
