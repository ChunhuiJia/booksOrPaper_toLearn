%  Figure 7.34      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
%% fig7_34.m
%% SRL for estimator design
clf;
s=tf('s');
sys=1/((s^2+1)*(s^2+1));
rlocus(sys);
title('Fig. 7.34: SRL for Estimator Design');
text(0,0.9,'q\rightarrow 0');
text(0,-0.9,'q\rightarrow 0');
text(-5,4,'q\rightarrow\infty');
text(-5,-4,'q\rightarrow\infty'); 



