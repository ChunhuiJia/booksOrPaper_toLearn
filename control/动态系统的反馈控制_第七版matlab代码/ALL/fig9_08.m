% Fig. 9.8  Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.8
 s=tf('s');
 sys=(s+1)/s^2;
 rlocus(sys)
 axis([-6 2 -3 3]);
 hold on
 r=roots([1 1 1]);
 plot(r,'*')
  z=0:.1:.9;
 wn= 1:6;
 sgrid(z, wn)
 hold off
