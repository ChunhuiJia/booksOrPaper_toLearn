% Fig. 6.48   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%

clf
clear all;
%close all;
clf

num=0.01*[20 1];
den=[1 0 0]+[0 num];
w=logspace(-3,1,100);
[m,p]=bode(num,den,w);
loglog(w,m);
axis([.01 1 .1 10])
grid;
text(.12,1.2,'T(j\omega)')
text(.031,.15,'S(j\omega)')

hold on
% add line at mag = 0.707
w2=[.01 1];
mcl=[.707 .707];
loglog(w2,mcl,'r')

% now error FR
numE=[1 0 0];
denE=den;
[me,pe]=bode(numE,denE,w);
loglog(w,me)

xlabel('\omega (rad/sec)');
ylabel('Magnitude');
title('Fig. 6.48 Closed-loop frequency response.');
hold off
