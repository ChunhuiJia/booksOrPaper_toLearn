% Fig. 9.44   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.44
% script to run the time optimal system
% and plot the results
r=4;
sim('tos_sim');
figure(2)
subplot(211) 
plot(utos(:,1),utos(:,2));
axis([0 6 -1.2 1.2]); grid on;
title('Figure 9.44(a): Control for the time optimal system');
xlabel('Time (sec)');
ylabel('u(t)'); 
subplot(212); plot(ytos(:,1),ytos(:,2),'LineWidth',2);
axis([ 0 5 0 5]);
title('Figure 9.44(b): Output for the Time Optimal System');
xlabel('Time (sec)')
ylabel('y(t)')
grid
hold off