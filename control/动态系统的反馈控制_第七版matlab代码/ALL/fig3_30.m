%  Figure 3.30      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.30
clf;
a=1;
zeta=.5;
k=1/zeta;
s=tf('s');
sysT=(k/a*s+1)/(s^2+s+1);
t=0:.1:10;
yT=step(sysT,t);

num=[0 1];
syso=1/(s^2+s+1);
yo=step(syso,t);

sysd=(k/a*s)/(s^2+s+1);
yd=step(sysd,t);

axis([0 10 -.2 1.8])
plot(t,yo,'-',t,yd,'-',t,yT,'--','LineWidth',2);
text(3,.4,'y_d(t)');
text(2.2,.85,'y_0(t)');
text(3,1.5,'y(t)');
title('Fig. 3.30: Step response and its derivative')
xlabel('Time (sec)')
ylabel('y(t)')
grid