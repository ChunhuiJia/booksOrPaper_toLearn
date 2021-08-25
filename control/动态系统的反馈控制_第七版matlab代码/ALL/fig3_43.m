%  Figure 3.43      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.43
clf;
t=0:.05:10;
k=1;
ki=0;
s=tf('s');
sysCL1=(k*s+ki)/(s^3+3*s^2+(2+k)*s+ki);
y1=step(sysCL1,t);
ki=1;
sysCL2=(k*s+ki)/(s^3+3*s^2+(2+k)*s+ki);
y2=step(sysCL2,t);
k=10;
ki=5;
sysCL3=(k*s+ki)/(s^3+3*s^2+(2+k)*s+ki);
y3=step(sysCL3,t);
axis([0 10 0 1.2]);
plot(t,y1,t,y2,t,y3,'LineWidth',2);
xlabel('Time (sec)');
ylabel('y(t)');
title('Fig. 3.43: Transient responses');
axis('normal');
text(2,.25,'K = 1, K_I = 0');
text(3,0.75,'K= 1, K_I = 1');
text(1.5,1.1,'K = 10, K_I = 5');
grid



