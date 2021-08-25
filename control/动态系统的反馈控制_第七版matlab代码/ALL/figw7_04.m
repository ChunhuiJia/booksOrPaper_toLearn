%  Figure w7.4      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script for Fig. w7.4             
% 
%clf;
dp=[1 1 0];
np=[1];
sysp=tf(np,dp);
nc=conv([1 1],[8.32 0.8]);
dc=conv([1 4.08],[1 0.0196]);
sysc=tf(nc,dc);
syscl=feedback(sysc*sysp,1);
t=0:.01:5;
y=step(syscl,t);
%figure(1)
%plot(t,y,'LineWidth',2)

%xlabel('Time (sec)');
%ylabel('y');
%title('Fig.7.52(a) Step response for lag compensation design');
%nicegrid;
% Control effort
sysclu=feedback(sysc,sysp);
u=step(sysclu,t);
%figure(2)
%plot(t,u,'LineWidth',2); 
%xlabel('Time (sec)');
%ylabel('y');
%title('Fig.7.52 (b) Control effort for lag compensation design');
%nicegrid;

% Discrete Implementation
[A,B,C,D]=tf2ss(nc,dc);
% Samplig period
ts=0.1;
% Convert controller to discrete

[Ad,Bd,Cd,Dd]=c2dm(A,B,C,D,ts,'zoh');
[ncd,dcd]=ss2tf(Ad,Bd,Cd,Dd);
% response comparison of continuous and digital control.
sim('figw7_03')
figure(1)
plot(ycd(:,1),ycd(:,2),'LineWidth',2)
hold on
plot(ycd(:,1),ycd(:,3),'g--','LineWidth',2)
title('Figure w7.4(a): Output Responses of Digital and Continuous Controllers')
xlabel('Time (sec)');
ylabel('y');
text(0.5,0.5,'continuous controller')
text(0.1,1.15,'digital controller')
grid
hold off
%pause;
figure(2)
plot(ucd(:,1),ucd(:,2),'LineWidth',2)
hold on
plot(ucd(:,1),ucd(:,3),'g--','LineWidth',2)
title('Figure w7.4(b): Control Responses of Digital and Continuous Controllers')
xlabel('Time (sec)');
ylabel('u');
text(0.5,0.5,'continuous controller')
text(1.1,-1.5,'digital controller')
grid
hold off

