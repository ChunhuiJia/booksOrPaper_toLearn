%  Figure 7.80      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.80
%% fig7_80.m
%% Heat Exchanger
clf;
[t]=sim('fig7_79cl');
plot(t,y,'LineWidth',2);
title('Fig. 7.80: Open and Closed-loop responses for heat exchanger');
text(50,1.2,'Closed-loop'); 
xlabel('Time (sec)');
ylabel('Output Temperature, y');
axis([0 300 0 1.4]);
hold on;
[t1]=sim('fig7_79ol');
plot(t1,yol,'g','LineWidth',2);
text(50,0.4,'Open-loop');
grid;
hold off;




