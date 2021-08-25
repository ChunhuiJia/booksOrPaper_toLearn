% Fig. 9.26   Feedback Control of Dynamic Systems, 7e 
%             Franklin, Powell, Emami
%script to generate Figure 9.26

clear all;
close all;
%saturation nonlinearity

N=1;
k= 1;
n=10; 
j=1;
for i=1:0.1:n
    Keq(j) = (2/pi)*(k*asin(N/(k*i))+(N/i)*sqrt(1-(N/(k*i))^2));
    j=j+1;
end;
plot([0,1:0.1:n],[1 Keq],'LineWidth',2);
axis([0 10 0 1.1]) 
title('Describing function for saturation nonlinearity')
xlabel('a')
ylabel('K_{eq}')
grid;
hold off