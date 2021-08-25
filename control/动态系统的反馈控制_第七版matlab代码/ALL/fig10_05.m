%  Figure 10.05      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_05.m is a script to generate Fig. 10.5   
% root locus, for the PD design for the satellite 
clf;
% parameters of two-mass spring model
m=[1, 0.1]; k0=[0, 0.091] ; d0=[0, 0.0036]; k1=[0, 0.4];

% call two mass-spring model function 
[A,B,C,D] = twomass(m,k0,d0);
nc1=0.25*[2, 1];
dc1=[1/40, 1];

% convert controller to state-space
[Ac,Bc,Cc,Dc]=tf2ss(nc1, dc1);

% series of controller and plant
[Aol,Bol,Col,Dol]= series(Ac,Bc,Cc,Dc,A,B,C,D);
[Acl]=Aol-Bol*Col;

hold off ; clf

rlocus(Aol,Bol,Col,Dol)
grid;
v =[-2.0000,    2.0000,   -1.5000,    1.5000];
axis(v); 
title('Fig. 10.5: Root locus for the PD design of the satellite')
% 
