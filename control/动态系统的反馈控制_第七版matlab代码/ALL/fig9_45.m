% Fig. 9.45   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.45
% script to run the ptos simulation
r=4;
clf
L=.005;
N=1.00;
alph=.95;
Na=N*alph;
k1=1/L;
k2=sqrt(2/(N*L));
sim('ptos_sim'); 
figure(1)
subplot(211);
plot(uptos(:,1),uptos(:,2),'LineWidth',2)
axis([0 2.5*sqrt(r/N) -1.2*N 1.2*N]); 
title('Figure 9.45 (a): Control for the  PTOS, \alpha = 0.9')
xlabel('Time (sec)');
ylabel('u(t)');
grid on
hold on
subplot(212);
%figure(2)
plot(yptos(:,1),yptos(:,2),'LineWidth',2);
axis([ 0 2.5*sqrt(r/N) 0 1.2*r]);
title('Figure 9.45(b): Output for the PTOS')
xlabel('Time (sec)');
ylabel('y(t)');
grid
hold off
