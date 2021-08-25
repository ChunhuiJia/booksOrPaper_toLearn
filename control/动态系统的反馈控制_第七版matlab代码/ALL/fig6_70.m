%  (1) Figure 6.69      Feedback Control of Dynamic Systems, 7e
%  (2) Fig. 6.70                Franklin, Powell, Emami
%  (3) Fig. 6.82

clear all
%close all;
clf

num=0.9*0.05*conv([1 2],[10 1]);  %
num=conv(num,[1 0.005]);   % CL num for theta/theta_com
den=[1 2 0 0 0];
den=den+[0 0 2*0.9*0.05*conv([10 1],[1 0.005])]; % CL denominator
t=0:.5:40;
sysT=tf(num,den);
y=step(sysT,t);
%roots(den)  % CL poles
%roots(num)  % Zeros
figure(1)
subplot(2,1,1)
plot(t,y);
grid;
xlabel('Time (sec)');
ylabel('\theta (Deg)');
title('Fig. 6.69 (a) Unit Step Command Response with PID compensator');
subplot(2,1,2)
%now disturbance response
numd=0.9*[1 2 0];     % CL num for theta/T_D
t=0:5:1000;
yd=step(numd,den,t);
plot(t,0.1*yd);
grid;
xlabel('Time (sec)');
ylabel('\theta (Deg)');
title('Fig. 6.69 (b) Step Disturbance Response with PID compensator');

% now FR of the error vs. disturbance
figure(2)
subplot(1,1,1)
w=logspace(-3,1);
[m1,p1]=bode(num,den,w);   % theta/theta_com 
loglog(w,m1,'b')
axis([.001 1 .001 10])
hold on
numS=[1 2 0 0 0];
[m2,p2]=bode(numS,den,w);     % sensitivity function
loglog(w,m2,'b')

%[m3,p3]=bode(numd,den,w);   % unit disturbance response
%loglog(w,m3), grid
xlabel('\omega (rad/sec)')
ylabel('Magnitude')
title('Fig. 6.70 Freguency Responses of Satellite Controller with PID compensator');
grid
hold off

%now do open loop for Nichols

figure(3)
subplot(1,1,1)
numOL=0.9*0.05*2*conv([10 2],[1 0.005]);  %
denOL=[1 2 0 0 0];
sysDGH=tf(numOL,denOL)
nichols(sysDGH)
grid
axis([-200 -40 -20 20])
title('Fig. 6.82 Nichols Chart for Satellite Controller with PID compensator');
