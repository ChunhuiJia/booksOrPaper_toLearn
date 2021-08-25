%  Figure 3.32      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.32
% Pole-zero effects
%

t=0:.01:2.5;

z=1;
s=tf('s');
sys1=4*6*(1/z*s+1)/((s+4)*(s+6));
[y1]=step(sys1,t);
plot(t,y1,'LineWidth',2);
hold on;
z=2;
sys2=4*6*(1/z*s+1)/((s+4)*(s+6));
[y2]=step(sys2,t);
plot(t,y2,'LineWidth',2);
z=3;
sys3=4*6*(1/z*s+1)/((s+4)*(s+6));
[y3]=step(sys3,t);
plot(t,y3,'LineWidth',2);
z=4;
sys4=4*6*(1/z*s+1)/((s+4)*(s+6)); 
[y4]=step(sys4,t);
plot(t,y4,'--','LineWidth',2);
z=5;
sys5=4*6*(1/z*s+1)/((s+4)*(s+6));
[y5]=step(sys5,t);
plot(t,y5,'LineWidth',2);
z=6;
sys6=4*6*(1/z*s+1)/((s+4)*(s+6));
[y6]=step(sys6,t);
plot(t,y6,'-.','LineWidth',2);
text(.2,2.2,'{\it z} =1');
text(.2,1.3,'{\it z} =2');
text(.2,1.05,'{\it z} =3');
text(.2,0.5,'{\it z} =6');

xlabel('Time (sec)');
ylabel('Unit step response');
title('Fig. 3.32: Effect of zero location');
grid