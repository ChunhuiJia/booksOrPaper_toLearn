% Fig. 9.33   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
% script to generate Figure 9.33

clear all;
close all;
%saturation nonlinearity (Figure 9.33)

N=0.1;
k= 1;
n=10
j=1;
for i=0.1:0.01:n
    Keq(j) = (2/pi)*(k*asin(N/(k*i))+(N/i)*sqrt(1-(N/(k*i))^2));
    if (k*i/N)<=1, Keq(j)=1;end;
    j=j+1;
end; 
plot([0,0.1:0.01:n],[1 Keq],'LineWidth',2);
axis([0 10 0 1.1]) 
title('Describing function for saturation nonlinearity')
xlabel('\it a')
ylabel('\it K_{eq}');
grid;
hold off