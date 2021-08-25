%  Figure 9.47      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%% script to generate Figure 9.47
%% Simulink Simulation for Position Control
clf;
[t,x,y]=sim('fig9_46');
plot(t',x','LineWidth',2);
xlabel('Time (sec)');
ylabel('Amplitude');
title('Fig. 9.47: Position Control');
text(5,0.95,'Output');
text(3.5,0.3,'x_2'); 
grid;




