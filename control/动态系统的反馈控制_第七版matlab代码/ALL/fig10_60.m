%  Figure 10.60      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_60.m is a script for the LQR(LQG) design for the disk  
% drive case study

clf;
wm= 5*pi;
z=.05;
GM = 4;
a=0.1;
numG= [1/(50*pi) 1];
denG=[1/(25*pi^2) 1/(50*pi) 1  0 0]; 
sysG=tf(numG,denG);
% form the system with y + a*ydot output
numGv=[0 numG]+.09*[numG 0];
sysGv=tf(numGv,denG);
% convert the design system to state form
[a,b,c,d]=ssdata(sysGv);
sysGvs=ss(a,b,c,d);
K=lqry(sysGvs,10000,1)
% form the state feedback
ac=a-b*K;
sysR=ss(ac,b,c,d);
[num,den]=tfdata(sysR,'v');
% remove the zero used to weight ydot
sysCLR=tf(numG,den);
[ac,b,c,d]=ssdata(sysCLR);
% normalize the gain for unity dc
k=c*inv(-ac)*b
b1=b/k;
sysCLR=ss(ac,b1,c,d);
t=0:.01:1.4;
[y,t]=step(sysCLR,t);
plot(t,y,'LineWidth',2);
xlabel('Time (msec)');
ylabel('Amplitude');
grid;
title('Fig. 10.60:Step response of the LQR design for the disk');
%pause;
pc=eig(sysCLR);
pe=10*pc;
[A,B,C,D]=ssdata(sysG);
L=place(A',C',pe)';
Nbar=1
a=[A-B*K-L*C];
b=[L -L];
c=-K;
d=[0 0];
sysF=ss(a,b,c,d);
sysOL=sysF*sysG;
sysH=tf(1,1);
sysCL=feedback(sysOL,sysH,2,1);

