%  Figure 7.73      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 7.73
% LTR Example 
% 
clf;
A=[0 1; 0 0]; % define system matrices
B=[0;1];
C=[1 0];
D=[0];
sys0=ss(A,B,C,D); % form system
C1=[1 0];
sys=ss(A,B,C1,D);
w=logspace(-1,3,1000); % form frequency vector
rho=1;
Q=rho*C1'*C1;          % define weights
r=1;
[K]=lqr(A,B,Q,r)       % compute LQR gain
sys1=ss(A,B,K,0);      % form loop gain
[maggk1,phasgk1,w]=bode(sys1,w); % Bode plot of loop gain
%pause;
rv=1; 
rho=[1 10 100];
% LTR
for i=1:3,
    gam=rho(i)*B;
    Q1=gam'*gam;
    [L]=lqe(A,gam,C,Q1,rv)
    Ac=A-B*K-L*C;
    Bc=L;
    Cc=K;
    Dc=0;
    sysk=ss(Ac,Bc,Cc,Dc);
    sysgk=series(sys0,sysk);
    [maggk,phsgk,w]=bode(sysgk,w);
    [gm,phm,wcg,wcp]=margin(maggk,phsgk,w)
    subplot(2,1,1);
    loglog(w,[squeeze(maggk1) squeeze(maggk)],'LineWidth',2);
    xlabel('\omega (rad/sec)');
    ylabel('Magnitude');
    title('Fig. 7.73: loop gain');
    axis([0.1 1000 1e-8 1e3]);
    text(100,10e-8,'q = 1');
    text(100,10e-6,'q = 10');
    line([0.1 1000],[1 1],'LineWidth',2);
    line([10.5356 10.5356],[1 0.1]);
    text(11,0.5,'GM','LineWidth',2);
    text(100,10e-4,'q = 100');
    text(300,1e-2,'LQR');
    grid on;
    hold on;
    subplot(2,1,2);
    semilogx(w,[squeeze(phasgk1) squeeze(phsgk)],'LineWidth',2);
    xlabel('\omega (rad/sec)');
    ylabel('Phase (deg)');
    text(10,-240,'q = 1');
    text(10,-170,'q = 10');
    text(10,-120,'q = 100');
    grid;
    hold on;
 end;
axis([0.1 1000 -270 -90]);
set(gca,'YTick',[-270 -240 -210 -180 -150 -120 -90]);
set(gca,'YTickLabel',[-270 -240 -210 -180 -150 -120 -90]);
line([0.1 1000],[-180 -180],'LineWidth',2);
line([1.4124 1.4124],[-180+55.07 -180],'LineWidth',2);
text(2,-150,'PM');
text(1.1,-100,'LQR');
%Bode grid
bodegrid
