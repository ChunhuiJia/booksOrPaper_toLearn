% Figure 3.37      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.37
% Extra Pole
clear all;
clf;
wn=1;
s=tf('s');
zeta=[0.5,0.707,1.0];
alpha=.3:.01:10;
t=0:.01:10;
display('This computation takes a couple of minutes');
for j=1:3;
for k=1:length(alpha);
    [y,t]=step(1/((s/(alpha(k)*zeta(j)*wn)+1)*((s/wn)^2 +2*zeta(j)*s/wn+1)),t);
    wntr(j,k)=risetime(t,y);
end
end
plot(alpha,wntr,'LineWidth',2);
axis([0 10 0 9]);
xlabel('\alpha');
ylabel('\omega_nt_r');
grid;
text(4,1.5,'\zeta=0.5');
text(4,2.7,'\zeta=0.707'); 
text(4,4,'\zeta=1.0');
title(' Figure 3.37: Normalized rise time for several locations of an additional pole');

