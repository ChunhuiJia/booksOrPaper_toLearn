function tr = risetime(t,y)
% A. Emami  2006
% normalize y to 1:
y = y/y(length(y));

idx1 = min(find(y>=0.1));
idx2 = min(find(y>=0.9));

if ~isempty(idx1) & ~isempty(idx2);
    tr = t(idx2) - t(idx1);
else
    tr = 0
end

