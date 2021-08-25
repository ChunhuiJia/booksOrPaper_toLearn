%  Figure 3.28     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.28

clf;
zeta=.707;
k=1/zeta;

a=10;
sys1=(k/a*s+1)/(s^2+s+1);
t=0:.1:10;
y1=step(sys1,t);

a=4;
sys2=(k/a*s+1)/(s^2+s+1);
t=0:.1:10;
y2=step(sys2,t);

a=2;
sys3=(k/a*s+1)/(s^2+s+1); 
t=0:.1:10;
y3=step(sys3,t);

a=1;
sys4=(k/a*s+1)/(s^2+s+1);
t=0:.1:10;
y4=step(sys4,t);

plot(t,y1,'-',t,y2,'-',t,y3,'-',t,y4,'-','LineWidth',2);
title('Fig. 3.28: Step response with \zeta = 0.707');
xlabel('\omega_n t');
ylabel('Step response of \it{H(s)}');
axis([0 10 0 1.8]);
text(.1,.9,'\alpha=');
text(.6,.9,'1');
text(1.1,.9,'2');
text(1.4,.85,'4');
text(1.8,.8,'100');
grid