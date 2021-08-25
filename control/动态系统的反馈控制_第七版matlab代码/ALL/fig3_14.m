%  Figure 3.14     Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.14
%  fig3_14.m      
% clf;
einv=1/exp(1);
s=tf('s');
sys=1/(s+1);
t=0:.05:4;
y=impulse(sys,t);

% define some lines for the plot
tl=[0 1];
yl=[1 0];
t1=[1 1];
y1=[0 einv];
t2=[0 1];
y2=[einv einv];
figure();
plot(t,y,'-',tl,yl,'--',t1,y1,':',t2,y2,':','LineWidth',2)
title('Fig. 3.14(a): First order system impulse response')
xlabel('Time (sec)')
ylabel('h(t)')
text(0.7,0.6,'e^{-\sigmat}');
text(1.1,0.3679,'\leftarrow 1/e');
text(1,0.05,'\downarrow t = \tau');
grid 
pause;
% Figure 3.14 (b)
a=1;
sys=a/(s+a);          % form transfer function
t=0:0.01:4;           % form time vector
h=impulse(sys,t);     % compute impulse response
figure();
plot(t,h,'LineWidth',2);% plot impulse response
y=step(sys,t);        % compute step response
hold
plot(t,y,'LineWidth',2);            % plot step response
xlabel('Time (sec)');
ylabel('h(t),y(t)');
title('Fig. 3.14(b): Impulse and step responses');
text(2,0.8,'y(t)');
text(2,0.2,'h(t)');
grid
