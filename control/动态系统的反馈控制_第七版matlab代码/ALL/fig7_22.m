%  Figure 7.22      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig7_22.m
% script to generate Fig. 7.22
% tradeoff curve for LQR
clf;
A=[0 1;0 0];
B=[0;1];
C=[1 0];
D=0;
sys=ss(A,B,C,D);
display('This computation takes several seconds');
% Initial condition
xo=[1 1]';
R=1;
i=1;
for rho=0.01:0.1:100;
   Q=rho*C'*C; 
   [K,S]=lqr(A,B,Q,R);
   Acl=A-B*K;
   sys1=ss(Acl',C',[],[]);
   w1=gram(sys1,'c');
   yy(i)=xo'*w1*xo;
   sys2=ss(Acl',K',[],[]);
   w2=gram(sys2,'c');
   uu(i)=xo'*w2*xo;
   jj(i)=xo'*s*xo;
   i=i+1;
end;
plot(uu,yy,'red','LineWidth',2);
title('Fig. 7.22: Design trade-off curve');
text(uu(1)+1,yy(1),'\rho = 0.01');
text(uu(1000)-2,yy(1000)+1,'\rho = 100');
text(uu(11),yy(11)+1,'\rho = 1');
line([uu(1) uu(1)],[yy(100) yy(1)],'LineStyle','--','LineWidth',2);
line([uu(1) uu(100)],[yy(100) yy(100)],'LineStyle','--','LineWidth',2);
text(uu(1),yy(1),'x');
text(uu(1000),yy(1000),'x');
text(uu(11),yy(11),'x');
xlabel('\int_0^\infty u^2dt')
ylabel('\int_0^\infty z^2dt');
grid;

