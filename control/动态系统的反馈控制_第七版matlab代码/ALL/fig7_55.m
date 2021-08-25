%  Figure 7.55      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% 
% script to generate Fig. 7.55             
%  
clf;
A=-3;
B=1;
C=1;
D=0;
ko=7;
k1=25;
l=7;
acl=[A,-ko,-k1;l,A-B*ko-l*C,-k1;1,0,0];
bcl=[0;0;-1];
ccl=[C, 0, 0];
dcl=[0];
t=0:.01:5;
syscl=ss(acl,bcl,ccl,dcl);
y1=step(syscl,t);
cclu=[0, -ko,-k1];
sysclu=ss(acl,bcl,cclu,dcl);
yu1=step(sysclu,t);
bclw=[1;1;0];
dclw=1;
sysclw=ss(acl,bclw,ccl,dcl);
syscluw=ss(acl,bclw,cclu,dclw);
y2=step(sysclw,t);
yu2=step(syscluw,t);
figure(1)
plot(t,y1,t,y2,'LineWidth',2);
text(0.75,.85,'y_1');
text(0.75,.05,'y_2');
title('Figure 7.55 (a): Step response and error signal')
xlabel('Time (sec)');
ylabel('y(t)');
grid

figure(2)
plot(t,yu1,t,yu2,'LineWidth',2);
text(0.25,2.4,'u_1');
text(0.25,0.25,'u_2');
title('Figure 7.55 (b): Control effort')
xlabel('Time (sec)');
ylabel('u(t)');
grid;

