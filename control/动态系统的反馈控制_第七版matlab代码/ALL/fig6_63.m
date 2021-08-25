%  Figure 6.63      Feedback Control of Dynamic Systems, 7e
%                   Franklin, Powell, Emami
%  

clear all
%close all
clf

num=3;
den=conv([2 1],[1 1]);
den=conv(den,[0.5 1]);
w=logspace(-2,1,500);
[mag,phas]=bode(num,den,w);
[OLGM,OLPM,OLWcg,OLWcp]=margin(mag,phas,w);

%Lag compensator 
numl=3*[5 1];
denl=[15 1];
numc=conv(num,numl);
denc=conv(den,denl);
[magc,phasc]=bode(numc,denc,w);
[D1GM,D1PM,D1Wcg,D1Wcp]=margin(magc,phasc,w);
dencl=denc+[0 0 0 numc];
t=0:.1:20;
y=step(numc,dencl,t);

plot(t,y);
grid;
xlabel('Time (sec)');
ylabel('y');
title('Fig. 6.63  Step Response of lag compensation design, Ex 6.18');
