%  Figure 3.19     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.19
%  fig3_19.m                                                     
%
%clf;
t=0:.0001:12;
zeta=0;
s=tf('s');
sys1=1/(s^2+2*zeta*s+1);
y1=impulse(sys1,t);

zeta=0.1;
sys2=1/(s^2+2*zeta*s+1);
y2=impulse(sys2,t);

zeta=0.2;
sys3=1/(s^2+2*zeta*s+1);
y3=impulse(sys3,t);

zeta=0.3;
sys4=1/(s^2+2*zeta*s+1);
y4=impulse(sys4,t);

zeta=0.4;
sys5=1/(s^2+2*zeta*s+1);
y5=impulse(sys5,t);

zeta=0.5; 
sys6=1/(s^2+2*zeta*s+1);
y6=impulse(sys6,t);

zeta=0.6;
sys7=1/(s^2+2*zeta*s+1);
y7=impulse(sys7,t);

zeta=0.7;
sys8=1/(s^2+2*zeta*s+1);
y8=impulse(sys8,t);
figure();
plot(t,y1,'-',t,y2,'-',t,y3,'-',t,y4,'-')

zeta=0.8;
sys9=1/(s^2+2*zeta*s+1);
y9=impulse(sys9,t);

zeta=0.9;
sys10=1/(s^2+2*zeta*s+1);
y10=impulse(sys10,t);

zeta=1;
sys11=1/(s^2+2*zeta*s+1);
y11=impulse(sys11,t);
plot(t,y1,t,y2,t,y3,t,y4,t,y5,t,y6,t,y7,t,y8,t,y9,t,y10,t,y11,'LineWidth',2)
axis([0 12 -1 1])
title('Fig. 3.19(a): Impulse response vs. \zeta')
xlabel('\omega_n t ')
ylabel('y(t)')

% grid
nicegrid

hold off
pause;
%  Figure 3.19 (b)     
%clf
num=1;
t=0:.0001:12;

zeta=0;
sys1=1/(s^2+2*zeta*s+1);
y1=step(sys1,t);

zeta=0.1;
sys2=1/(s^2+2*zeta*s+1);
y2=step(sys2,t);

zeta=0.2;
sys3=1/(s^2+2*zeta*s+1);
y3=step(sys3,t);

zeta=0.3;
sys4=1/(s^2+2*zeta*s+1);
y4=step(sys4,t);

zeta=0.4;
sys5=1/(s^2+2*zeta*s+1);
y5=step(sys5,t);

zeta=0.5;
sys6=1/(s^2+2*zeta*s+1);
y6=step(sys6,t);

zeta=0.6;
sys7=1/(s^2+2*zeta*s+1);
y7=step(sys7,t);

zeta=0.7;
sys8=1/(s^2+2*zeta*s+1);
y8=step(sys8,t);

zeta=0.8;
sys9=1/(s^2+2*zeta*s+1);
y9=step(sys9,t);

zeta=0.9;
sys10=1/(s^2+2*zeta*s+1);
y10=step(sys10,t);

zeta=1;
sys11=1/(s^2+2*zeta*s+1);
y11=step(sys11,t);

figure();
plot(t,y1,t,y2,t,y3,t,y4,t,y5,t,y6,t,y7,t,y8,t,y9,t,y10,t,y11,'LineWidth',2),
title('Fig. 3.19(b): Step response vs. \zeta')
xlabel('\omega_n t ')
ylabel('y(t)')
axis([0 12 0 2])
grid

hold off

