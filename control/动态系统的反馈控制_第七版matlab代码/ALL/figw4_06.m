
%Figure w4.6   Feedback Control of Dynamic Systems, 7e
%                      Franklin, Powell, Emami 
% 
% response comparison of continuous and digital control.
clf;
s=tf('s');
sysc=(s+6)/s;
T=.07; 
sysD=c2d(sysc,T,'t');
[numD,denD]=tfdata(sysD,'v' ) 
sim('figw4_06_sim')
figure(1)
plot(ycd(:,1),ycd(:,2),':','LineWidth',2)
hold on
plot(ycd(:,1),ycd(:,3),'LineWidth',2)
xlabel('Time (sec)');
ylabel('Output responses');
title('Figure w4.6(a):Output Responses')
gtext('continuous controller')
gtext('discrete controller, T =.07 sec')
grid;
pause;
figure(2)
plot(ucd(:,1),ucd(:,2),':','LineWidth',2)
hold on
plot(ucd(:,1),ucd(:,3),'LineWidth',2)
title('Figure w4.6(b): Control Responses')
xlabel('Time (sec)');
ylabel('Control signals');
gtext('continuous controller')
gtext('discrete controller, T =.07 sec')
grid;
pause
%hold off;
% close all;
T=.035;

sysD=c2d( sysc,T,'t');
[numD,denD]= tfdata(sysD,'v')
sim('figw4_06_sim')
figure(3)
plot(ycd(:,1),ycd(:,2),':','LineWidth',2)
hold on
plot(ycd(:,1),ycd(:,3),'LineWidth',2)
xlabel('Time (sec)');
ylabel('Output responses');
gtext('discrete controller, T =.035 sec')
grid;
% hold off
pause;
figure(4)
plot(ucd(:,1),ucd(:,2),':','LineWidth',2)
hold on
plot(ucd(:,1),ucd(:,3),'LineWidth',2)
xlabel('Time (sec)');
ylabel('Control signals');
gtext('discrete controller, T=.035 sec')
grid;
hold off
