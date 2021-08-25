%  Figure 3.36      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.36 

clf;
zeta =.5;
s=tf('s');

k =1/zeta;
a=100;
sys1=1/((s^2+2*zeta*s+1)*(k/a*s+1));
t=0:.1:10;
y1=step(sys1,t);

a=5;
sys2=1/((s^2+2*zeta*s+1)*(k/a*s+1));
y2=step(sys2,t);

a=2;
sys3=1/((s^2+2*zeta*s+1)*(k/a*s+1));
y3=step(sys3,t);

a=1;
sys4=1/((s^2+2*zeta*s+1)*(k/a*s+1));
y4=step(sys4,t);

plot(t,y1,'-',t,y2,'--',t,y3,'-.',t,y4,':','LineWidth',2);
title('Fig. 3.36: Step response with extra pole, \zeta = 0.5');
xlabel('\omega_n t  ');
ylabel('y(t)');
text(.9,.9,'\alpha = 100');
text(2.5,.9,'5');
text(3.2,.9,'2');
text(4.5,.9,'1');
grid;
