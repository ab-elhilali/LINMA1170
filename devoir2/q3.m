clear all;
load devoir2_image;
for a = [0.2 0.4 0.45 0.5]
    fprintf('%.2f', a);
    [i1 i2] = Question3(I, a, 0.6, 'Jacobi', 2);
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question3(I, a, 0.6, 'Gauss-Seidel', 2);
    fprintf(' & %d & %d', i1, i2);
    fprintf('\\\\\n');
end