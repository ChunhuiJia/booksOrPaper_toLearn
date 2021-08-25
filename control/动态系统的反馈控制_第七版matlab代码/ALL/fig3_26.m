%  Figure 3.26      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.26
%  Example 3.27    
%                  

clf;
tr=.6;
Wn=1.8/tr;
ts=3;
sig=4.6/ts;
zeta=.6;
theta=asin(zeta);
axis('square')
Ilim=3;
axis([-5 1 -Ilim Ilim])
eta = -pi/2:.1:pi/2;
rew=-Wn*cos(eta);
imw=Wn*sin(eta);
res=[-sig -sig];
ims=[-Ilim Ilim];
R=tan(theta)*Ilim;
red=[-R 0 -R];
imd=[-Ilim 0 Ilim];
plot(rew,imw,'--',res,ims,'--',red,imd,'--','LineWidth',2),
hold on
zer=[0 0];
plot([-5 1],zer,'-',zer,[-Ilim Ilim],'-','LineWidth',2) 
title('Fig. 3.26: Allowable region in the s-plane for Example 3.27')
xlabel('Re(s)')
ylabel('Im(s)')
hold off
axis('normal')
grid
