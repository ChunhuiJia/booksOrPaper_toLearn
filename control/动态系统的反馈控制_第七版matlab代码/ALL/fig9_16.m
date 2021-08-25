% Fig. 9.16   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.16
% using the general simulation nonlin
clf
N=0.1;
a=10/2;
r=0;
num=[1]; 
den=[1 .2 1 0];
nf=1;
df=1;
hold on
for r=[1 4 8];
   sim('nonsim',150)
   plot(yn(:,1),yn(:,2),'LineWidth',2)
end
title('Figure 9.16(a): Simulation of a limit cycle, step responses')
xlabel('Time (sec)');
ylabel('y(t)');
text(40,2,'r = 1')
text(70,5,'r = 4')
text(90,8.5,'r = 8')
grid
hold off
r=1;
sim('nonsim',50)
figure()
plot(yn1(:,1),yn1(:,2),'LineWidth',2)
xlabel('Time (sec)');
ylabel('u(t)');
title('Figure 9.16(b):Simulation of a limit cycle, control effort for r = 1');
axis([0 50 -0.15 0.15]);
grid