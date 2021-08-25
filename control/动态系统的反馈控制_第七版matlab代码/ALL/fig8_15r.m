% Fig. 8.15r   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%

clear all;
%close all;
clf

w=logspace(-1,2,100);
l=length(w);

% s-plane
num=5;
den=[1 5];
[magC,phaseC]=bode(num,den,w);
subplot(2,1,1),
loglog(w,magC,'k')
grid
axis([1  100  .01 1]);
ylabel('Magnitude')
%xlabel('Frequency (rad/sec)')
title(' (a) 150 rad/sec  T=0.042 sec')
hold on

%              T = 0.042 sec  (30 x W_b)
T = 0.042;

%  MPZ

num=.0945*[1 1];
den=[1 -.811];
[mag1,phase]=dbode(num,den,T,w);

%  MMPZ

num=.189;
den=[1 -.811];
[mag2,phase]=dbode(num,den,T,w);

% Tustins

num=.0950*[1 1];
den=[1 -.810];
[mag3,phase]=dbode(num,den,T,w);

%  ZOH

num=.189;
den=[1 -.811];
[mag4,phase]=dbode(num,den,T,w);

loglog(w,mag1,'b',w,mag2,'sb',w,mag3,'bo',w,mag4,'*b')
text(1.1,.11,'black line: Continuous')
text(1.1,.045,'blue squares: MMPZ')
text(1.1,.022,'blue ooooo: Tustin')
text(1.1,.013,'blue stars: ZOH')
text(1.1,.07,'blue line: MPZ')

hold off

%              T = 0.084 sec

subplot(2,1,2),loglog(w,magC,'k')
grid
ylabel('Magnitude')
xlabel('Frequency (rad/sec)')
title('(b) 75 rad/sec  T=0.084 sec')
axis([1  100  .01 1]);
hold on

T = 0.084;

%  MPZ

num=.1715*[1 1];
den=[1 -.657];
wp=w;
wp=wp(wp < 50);
[mag1,phase]=dbode(num,den,T,wp);

%  MMPZ

num=.343;
den=[1 -.657];
[mag2,phase]=dbode(num,den,T,wp);

% Tustins

num=.1735*[1 1];
den=[1 -.653];
[mag3,phase]=dbode(num,den,T,wp);

%  ZOH

num=.343;
den=[1 -.657];
[mag4,phase]=dbode(num,den,T,wp);

loglog(wp,mag1,'b',wp,mag2,'sb',wp,mag3,'ob',wp,mag4,'*b')

hold off

