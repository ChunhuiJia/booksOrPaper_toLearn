%  Figure w7.2      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script to generate Fig. w7.2               
%  
% 
clf;
% Plant
dp=[1 10 16 0]; 
np=[10];
sysp=tf(np,dp);
% Controller
nc=94.5*conv([1 7.98],[1 2.52]);
dc=conv([1 8.56 59.5348],[1 10.6]);
sysc=tf(nc,dc);
% Closed-loop system
syscl=feedback(sysc*sysp,1);
t=0:.01:5;
y=step(syscl,t);
% Control effort
sysclu=feedback(sysc,sysp);
u=step(sysclu,t);

figure(1)
plot(t,y,'LineWidth',2);
xlabel('Time (sec)');
ylabel('y');
%title('Fig.w7.2 (a) Step response');
grid;

u=step(sysclu,t);
figure(2)
plot(t,u,'LineWidth',2);
xlabel('Time (sec)');
ylabel('u');
%title('Fig.w7.2 (b) Control effort');
grid;hold off


[A,B,C,D]=tf2ss(nc,dc);
% Samplig period
ts=0.1;
% Convert controller to discrete
[Ad,Bd,Cd,Dd]=c2dm(A,B,C,D,ts,'zoh');
[ncd,dcd]=ss2tf(Ad,Bd,Cd,Dd)

% response comparison of continuous and digital control.
sim('figw7_01')
figure(1)
plot(ycd(:,1),ycd(:,2),'LineWidth',2)
hold on
plot(ycd(:,1),ycd(:,3),'g--','LineWidth',2)
title('Figure w7.2(a): Output Responses of Digital and Continuous Controllers')
xlabel('Time (sec)');
ylabel('y');
text(1.1,0.95,'continuous controller');
text(1,1.25,'digital controller'); 
grid;
hold off


figure(2)
plot(ucd(:,1),ucd(:,2),'LineWidth',2)
hold on
plot(ucd(:,1),ucd(:,3),'g--','LineWidth',2)
title('Figure w7.2(b): Control Responses of Digital and Continuous Controllers')
xlabel('Time (sec)');
ylabel('u');
text(0.1,-1.4,'continuous controller')
text(0.7,0.5,'digital controller')
grid
hold off

