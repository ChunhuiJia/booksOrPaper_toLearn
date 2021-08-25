% Fig. 9.43   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.43
% script to plot the phase plane for a bang-bang example
figure(1)
hold off
clf
N=-1;
x = -100;
xdot=  sqrt(200); 
sim('bang')
plot(xbang(:,2),xdotbang(:,2),'LineWidth',2);
hold on
N=1;
x = 100;
xdot=-sqrt(200);  
sim('bang');
plot(xbang(:,2),xdotbang(:,2),'LineWidth',2);
xlabel('x_1');
ylabel('x_2');
hold on
title(' Switching curve for 1/s^2 plant')
grid on
%script to plot the phase plane for a bang-bang example
figure(1)
hold off
clf
N=-1;
x = -100;
xdot=  sqrt(200);
sim('bang')
plot(xbang(:,2),xdotbang(:,2),'LineWidth',2);
hold on
N=1;
x = 100;
xdot=-sqrt(200);  
sim('bang');
plot(xbang(:,2),xdotbang(:,2),'LineWidth',2);
xlabel('x_1');
ylabel('x_2');
hold on
title('Switching curve for 1/s^2 plant');
grid
