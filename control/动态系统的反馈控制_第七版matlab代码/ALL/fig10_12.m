%  Figure 10.12      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%  fig10_12.m is a script to generate fig 10.12 
%  the  frequency response of the PD plus notch compensator of the 
%  satellite position control, non-colocated case



A =[0    1.0000         0         0;
   -0.9100   -0.0360    0.9100    0.0360;
         0         0         0    1.0000 ;
    0.0910    0.0036   -0.0910   -0.0036];
B =[0;
     0;
     0;
     1];

C =[1     0     0     0]; 

D =[0];
no3=conv(.25*[2 1],[1/.81 0 1]);
do3=conv([1/20 1],[1/625 2/25 1]);
[Ac3,Bc3,Cc3,Dc3]=tf2ss(no3,do3);
[Aol,Bol,Col,Dol]=series( Ac3,Bc3,Cc3,Dc3,A,B,C,D );
Acl=Aol-Bol*Col;
hold off; clf
subplot(211); 
w=logspace(-1,.5);
w(34)=1;
[mag3, ph3, w]=bode(Aol,Bol,Col,Dol,1,w);
%ph3=ph3-360*ones(size(ph3));
loglog(w,mag3,'LineWidth',2); grid; hold on;
loglog(w,ones(size(mag3)),'g','LineWidth',2);
xlabel('\omega (rad/sec');
ylabel('Magnitude, |KD_{c3}(s)G(s)|');
title('Fig. 10.12: Bode plot of KD_{c3}(s)G(s)')
subplot(212); 
semilogx(w,[ph3, -180*ones(size(ph3))],'LineWidth',2); grid; 
xlabel('\omega (rad/sec');
ylabel('Phase (deg)');
%Bode grid
bodegrid;
%
[Gm,Pm,Wcg,Wcp] = margin(mag3,ph3,w) 