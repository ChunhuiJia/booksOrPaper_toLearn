% Fig. 9.41   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.41
% script to plot the phase plane for a focus
figure(1)
hold off
clf
xdot = 0;
for k=1:6     
    x=-k/5;
    sim('focusmodel');
    plot(xfocus(:,2),xdotfocus(:,2),'LineWidth',2);
    hold on;
end
for k=1:6
        x=k/5;
    sim('focusmodel');
    plot(xfocus(:,2),xdotfocus(:,2),'LineWidth',2);
    hold on
end
title('Figure 9.41: Phase plane for a focus')
xlabel('x_1');
ylabel('x_2');
plot([-1.5 1.5],[0 0])
plot([0 0],[-4 4])
grid;