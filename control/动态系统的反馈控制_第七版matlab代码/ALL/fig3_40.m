 %  Figure 3.40     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. 3.40
clf;
k=7.5;
s=tf('s');
sysCL1=k*(s+1)/(s^3+5*s^2+(k-6)*s+k)
t=0:.05:12;
y1=step(sysCL1,t);
k=13;
sysCL2=k*(s+1)/(s^3+5*s^2+(k-6)*s+k)
y2=step(sysCL2,t);
k=25;
sysCL3=k*(s+1)/(s^3+5*s^2+(k-6)*s+k)
y3=step(sysCL3,t);
axis([0 12 -1 3]);
plot(t,y1,t,y2,t,y3,'LineWidth',2)
xlabel('Time (sec)');
ylabel('y(t)');
title('Fig. 3.40: Transient responses')
axis('normal');
text(3,2,'K=7.5');
text(2.1,1.5,'K=13');
text(1.4,1.2,'K=25'); 
grid;
