%  Figure 3.42      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
% script to generate Fig. 3.42
fh=@(ki,k) 6+3*k-ki;
ezplot(fh)
hold on;
f=@(ki,k) ki;
ezplot(f);

% add shading
fillvert = [0, -2
	        0,  7
			7, 7
			7, 0];
fcolor = [ .1 .1 .1 .1];
patch(fillvert(:,1)', fillvert(:,2)','b')

xlabel('K_I');
ylabel('K');
title('Fig. 3.42: Allowable region for stability');
grid;
hold off
