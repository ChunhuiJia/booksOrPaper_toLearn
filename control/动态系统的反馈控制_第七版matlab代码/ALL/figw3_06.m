%  Figure w3.6      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  Example w3.5   
clf;
t=[0 .1 .2 .3 .4 .5 1 1.5 2 2.5 3 4 10];
y=[0 .005 .034 .085 .140 .215 .510 .7 .817 .890 .932 .975 .9999];
dy=ones(1,13)-y;
A=-1.37;     % adjust A & alpha to get best fit
alpha=1.;     % to the data by trial and error
axis([0 6 -2 1]);
fity=-A*exp(-alpha*t);
dyl=log10(dy);
fityl=log10(fity);
plot(t,dyl,'o',t,fityl,'-');
title('Fig. w3.6: Plot of log10[y(\infty) - y(t)] versus t');
ylabel('log|1 - y(t)|');
xlabel('Time (sec)');
grid;
 
