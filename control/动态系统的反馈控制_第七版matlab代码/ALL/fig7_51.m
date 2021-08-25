%  Figure 7.51      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% script for fig. 7.51
%  
clf;
dp=[1 1 0];
np=[1];
nc=conv([1 1.001],[8.32 0.8]);
dc=conv([1 4.08],[1 0.0196]);
num=conv(np,nc);
den=conv(dp,dc);
w=logspace(-2,2);
sys=tf(num,den);
[mag, ph]=bode(sys,w);
mag1=[mag(:,:); ones(size(mag(:,:)))];
ph1=[ph(:,:);-180*ones(size(ph(:,:)))];
subplot(211) , loglog(w,mag1,'LineWidth',2), grid;
xlabel('\omega (rad/sec)');
ylabel('Magnitude');
title('Fig.7.51: Bode plot for lag-lead compensation design')
subplot(212), semilogx(w,ph(:,:),'LineWidth',2), grid
xlabel('\omega (rad/sec)');;
ylabel('Phase (deg)');
%Bode grid
bodegrid 