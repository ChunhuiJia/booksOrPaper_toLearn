%  Figure 3.29      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.29
% fig3_29.m
% Extra Zero
clear all;
clf;
wn=1;
s=tf('s');
zeta=[0.3,0.5,0.707];
alpha=.3:.01:10;
display('This computation takes a minute or so');
for j=1:3;
for k=1:length(alpha);
    [y]=step((s/(alpha(k)*zeta(j)*wn)+1)/((s/wn)^2 +2*zeta(j)*s/wn+1));
    Mp(j,k)=max(y)-1;
end
end
plot(alpha,Mp,'LineWidth',2);
axis([0 10 0 2]);
xlabel('\alpha');
ylabel('M_p');
grid;
text(1.5,0.15,'\zeta = 0.707'); 
text(3,0.3,'\zeta = 0.5');
text(4.5,0.6,'\zeta = 0.3');
title('Figure 3.29: Plot of overshoot M_p as a function of normalized zero location \alpha');

