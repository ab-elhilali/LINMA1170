function [dfdqp] = Jacobien (q,p)
j31=(2*q(1)^2 + q(2)^2)/((q(1)^2 + q(2)^2)^(5/2));
j32=(-3*q(1)*q(2))/((q(1)^2 + q(2)^2)^(5/2));
j41=(-3*q(1)*q(2))/((q(1)^2 + q(2)^2)^(5/2));
j42=(2*q(2)^2 + q(1)^2)/((q(1)^2 + q(2)^2)^(5/2));

dfdqp = [0 0 1 0; 0 0 0 1; j31 j32 0 0; j41 j42 0 0];
end