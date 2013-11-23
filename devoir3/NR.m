function [y i] = NR(y, w, W, A)
%NR Newton-Raphson implementation for non symetric matrix
%
i = 1;
eLim = 1e-18;
err = eLim +1;
l=length(A);

while i < 500 && err > eLim
    G = W'*A*(w+W*y)-w'*A*(w+W*y)*y;
    JG = W'*A*W-w'*A*w*eye(l-1)-(y*w'*A*W + w'*A*W*y*eye(l-1)); % function G's jacobian
    y1 = -(JG\G)+y;
    err = norm(y1-y);
    y= y1;
    i = i + 1;
end
y=w+W*y;
y=y/norm(y);
end