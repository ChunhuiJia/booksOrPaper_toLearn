%  Figure 3.35      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.35
%  Example 3.30      

clf;
u=-1;  % magnitude of impulsive elevator input (Deg)
s=tf('s');
sys=30*(s-6)/(s^3+4*s^2+13*s);
t=0:.02:5;
y=impulse(u*sys,t);
zero=[0 0];
tzero=[0 5];
axis([0 5 -2 16]);
plot(t,y,'-',tzero,zero,'-','LineWidth',2);
title('Fig. 3.35: Impulse response of aircraft altitude');
xlabel('Time (sec)');
ylabel('Altitude (ft)');
grid