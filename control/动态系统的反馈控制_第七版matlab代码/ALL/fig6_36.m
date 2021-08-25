% Fig. 6.36   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%

clear all;
%close all;
clf

pm=0*ones(1,91);
i=0;
for z=.1:.01:1;
pm1=atan(2*z/(sqrt( sqrt(1+4*z^(4))-2*z*z) ));
i=i+1;
pm(1,i)=pm1;
end;
zeta=.1:.01:1;
plot(pm*180/pi,zeta,100*zeta(1:71),zeta(1:71));
grid;
xlabel('Phase margin (Deg)');
ylabel('Damping ratio, \zeta');
title('Fig.6.36 Damping ratio versus phase margin (PM)');
