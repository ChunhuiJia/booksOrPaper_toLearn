%  Figure 10.6      Feedback Control of Dynamic Systems, 7e
%                        Franklin, Powell, Emami
%
% fig10_06.m is a script to generate Fig. 10.6        
% frequency response for the PD design for the satellite   
clf;
% parameters for the two-mass spring model
m=[1 .1]; k0=[0 .091] ; d0=[0 .0036]; k1=[0 .4];

% call function
[A,B,C,D]=twomass(m,k0,d0); 
nc1=0.25*[2 1];
dc1=[1/40 1];

% convert to state-space
[Ac,Bc,Cc,Dc]=tf2ss(nc1, dc1);

% series of controller and plant
[Aol,Bol,Col,Dol]= series(Ac,Bc,Cc,Dc,A,B,C,D);
[Acl]=Aol-Bol*Col;
w=logspace(-1,1);w(26)=1;
[magcl1, phcl1]= bode(Aol,Bol,Col,Dol,1,w);
subplot(211) ; 
loglog(w,[magcl1, ones(size(magcl1))],'LineWidth',2); 
xlabel('\omega (rad/sec)');
ylabel('Magnitude, |KD_{c1}(s)G(s)|');
title('Fig. 10.6: Frequency response for the satellite PD design')
grid
subplot(212);  
semilogx(w, [phcl1, -180*ones(size(phcl1))],'LineWidth',2); grid
xlabel('\omega (rad/sec)');
ylabel('Phase (deg)');

%Bode grid
bodegrid;