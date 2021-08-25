%  Function twomass      Feedback Control of Dynamic Systems, 7e
%                               Franklin, Powell, Emami
%
function [A,B,C,D] = twomass(m,k,b)
% [A,B,C,D] = twomass(m,k,b) computes the system matrices for a two-mass
%  system with masses m=[m1 m2] , spring constant k=[k1 k2] 
%  and damping b=[b1 b2]. Mass one is tied to a fixed point by k1,b1
%  and coupled to mass two by k2,b2.  The input is a force on m1, the
%  output is the position of m2.    
%         k1,b1 _______|-->y1 _______|--->y2= y
%    /|--/\/\/\| m1   |/\/\/\| m2   |
%    /|    u-->|______| k2,b2|______|_
%    /|
%   x=[y2 y2dot y1 y1dot]'
A = [0 1 0 0;-k(2)/m(2) -b(2)/m(2) k(2)/m(2) b(2)/m(2); 
    0 0 0 1; k(2)/m(1) b(2)/m(1) -(k(1)+k(2))/m(1) -(b(1)+b(2))/m(1)];
B = [0 0 0 1/m(1)]';
C = [1 0 0 0];
D = 0;
 
