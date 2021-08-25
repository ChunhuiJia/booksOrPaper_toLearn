%  Figure 3.4      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.4
%% fig3_04.m Example 3.6  
% Frequency response
clf;
k=1;
s=tf('s');
sys=1/(s+k);                % form transfer function

% frequency range
w=logspace(-2,2);
[mag,phase]=bode(sys,w);    % compute frequency response
% plot frequency response
subplot(2,1,1); loglog(w,mag(:),'LineWidth',2);xlabel('\omega (rad/sec)');
ylabel('M');title('Figure 3.4: Magnitude, phase');grid;
subplot(2,1,2); semilogx(w,phase(:),'LineWidth',2);xlabel('\omega (rad/sec)');
ylabel('\phi (deg)')
bodegrid;




