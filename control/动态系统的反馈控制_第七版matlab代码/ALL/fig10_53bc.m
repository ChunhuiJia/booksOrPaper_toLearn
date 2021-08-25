%  Figure 10.53      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_53.m is a script to generate Fig. 10.53, the step response
% for the fuel/air ratio with a nonlinear sensor.  A (3,3)
% Pade approximant is used to approximate the delay.
clf;
% construct the F/A dynamics with the sensor time-constant too
A =[-50     0     0;
     0    -1     0;
    10    10   -10];

B =[25.0000;
    0.5000;
         0];
C =[0     0     1]; 
D=0;
[A3,B3,C3,D3 ]=pade(.2,3); %  the delay Pade model
% put the plant and the delay in series
[Ap,Bp,Cp,Dp]=series(A,B,C,D,A3,B3,C3,D3); 
% construct the controller
nc=.1*[1 .3];
dc=[1 0]; % the PI controller in polynomial form
[Ac,Bc,Cc,Dc]= tf2ss(nc, dc); % put the controller in state space form
[Aol,Bol,Col,Dol] = series(Ac,Bc,Cc,Dc,Ap,Bp,Cp,Dp);
% get a discrete model for Ts = .01
[phi,gam] = c2d(Aol,Bol,.01);
% 
% form the closed-loop difference equation
x=[0 0 0 0 0 0 0]';
yout=[];

for t=0:.01:20;
 y=Col*x ;
 e=.4*sat(150*(.068-y));
 x=phi*x+gam*e;
 yout=[yout [e;y]];
end

t=0:.01:20;
subplot(211); 
plot(t,yout(1,:),'LineWidth',2);
axis( [0 20 -.6 .6]);
xlabel('Time (sec)');
ylabel('e');
title('Fig. 10.53(b): Error plot for nonlinear control of F/A')
grid on;

subplot(212);
plot(t,yout(2,:),'LineWidth',2);
axis([0 20 0 .09]);
xlabel('Time (sec)');
ylabel('F/A');
title('Fig. 10.53(c): Output F/A ratio for nonlinear control')
hold off;
grid

