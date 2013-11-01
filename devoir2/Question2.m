function [i1, i2] = Question2(L, a, iterator)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=sqrt(1 + 4*a + 4*a^2);
%k=0.02;
figure();
plot = subplot(2,2,1);
title(plot, 'Original');
colormap(gray);
imagesc(L);

%L(1,10)
%L(10,10)
%lk =
(1/k^2)*(L(1,10)+a*L(2,10)+a*L(1,11)+a*L(1,9)+a^2*L(2,9)+a^2*L(2,11))
%lk2 =
(1/k^2)*(L(10,10)+a*L(11,10)+a*L(9,10)+a*L(10,11)+a*L(10,9)+a^2*L(9,9)+a^2*L(11,11)+a^2*L(11,9)+a^2*L(9,11))

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1
e=ones(M,1);
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1);
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR; % initial blurred image

plot = subplot(2,2,2);
title(plot, 'Blurred');
colormap(gray);
imagesc(A);

Ad = (A+Delta); % blurred image with perturbation

plot = subplot(2,2,3);
title(plot, 'Blurred + noise');
colormap(gray);
imagesc(Ad);

Y=zeros(M,N);
X=zeros(N,M);

%tic()
% for i=1:N
%     if strcmp(iterator,'Jacobi')
%         [Y(:,i) i1] = Jacobi(TL, Ad(:,i), 0.00001);
%     else
%         [Y(:,i) i1] = GaussSeidel(TL, Ad(:,i), 0.00001);
%     end
% end

if strcmp(iterator,'Jacobi')
    [Y i1] = Jacobi(TL, Ad);
    [X i2] = Jacobi(TR, Y');
else
    [Y i1] = GaussSeidel(TL, Ad);
    [X i2] = GaussSeidel(TR, Y');
end

% for i=1:M
%     if strcmp(iterator,'Jacobi')
%         [X(:,i) i2] = Jacobi(TR, Y(i,:)', 0.00001);
%     else
%         [X(:,i) i2] = GaussSeidel(TR, Y(i,:)', 0.00001);
%     end
% end

%toc()
X=X';
plot = subplot(2,2,4);
title(plot, '(blured + noise) unblurred');
colormap(gray);
imagesc(X);

NORM2 = sqrt(sum(sum((X-L).^2)))

end
