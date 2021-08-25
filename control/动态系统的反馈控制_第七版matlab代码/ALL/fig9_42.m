% Fig. 9.42   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.42
% script to plot the phase plane for a bang-bang example
figure(2)
hold off
clf
N=-1;
x = -100;
for k=7:11;
xdot=2.02*k; 
sim('bang');
plot(xbang(:,2),xdotbang(:,2),'b-',xbang(:,2),-xdotbang(:,2),'b-','LineWidth',2);
xlabel('x_1');
ylabel('x_2');
text(-120,19,'u = -1');
hold on;
end;
N=1;
x = 100;
for k=7:11;
xdot=-2.02*k;
sim('bang')
plot(xbang(:,2),xdotbang(:,2),'r-',xbang(:,2),-xdotbang(:,2),'r-','LineWidth',2);
hold on;
end
text(100,-17,'u = +1');
title('Figure 9.42: Switching curves for 1/s^2 plant')
grid
