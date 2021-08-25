%Model-following Design Using Algorithm from Bryson (1994)
[n,m]=size(B); 
[p,n]=size(C);
J=zeros(p,m);
[nm,nm]=size(Am);
aa=[kron(eye(nm),A)-kron(Am',eye(n)) kron(eye(nm),B); kron(eye(nm),C) kron(eye(nm),D)];
bb=[zeros(nm*n,1);Cm(:)];
xx=aa\bb;
M=reshape(xx(1:n*nm),n,nm)
N=reshape(xx(n*nm+1:end),p,nm)