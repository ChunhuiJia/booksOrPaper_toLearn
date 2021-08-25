% Fig. 9.37   Feedback Control of Dynamic Systems, 7e 
%              Franklin, Powell, Emami
% script to generate Figure 9.37

% script to run the time optimal system
% and plot the results
sim('fig9_36')
plot(tout,simout,'LineWidth',2);
title('Figure 9.37 limit cycle oscillations');
xlabel('Time (sec)');
ylabel('Output, y');
grid;
