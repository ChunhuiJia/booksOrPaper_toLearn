%  Figure 3.24      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.24
% fig3_24.m                                                      

clf;
zeta = 0:.02:.98;
Mp = 100*exp(-pi*zeta./sqrt(1 - zeta.^2));
plot(zeta,Mp,'LineWidth',2);
title('Fig. 3.24: M_p vs. \zeta for a 2nd order system')
xlabel('\zeta')
ylabel('Mp (%)');
hold on;
% define some lines for the plot
xl=[0 0.5];
yl=[16 16];
x2=[0 0.707];
y2=[5 5];
plot(xl,yl,'--',x2,y2,'--','LineWidth',2)
plot(.5,16,'o')
plot(.7,5,'o')
text(.1,8,'5%');
text(0.1,19,'16%');
grid
