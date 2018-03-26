function [Y,Z] = nextyear(X, k)
    T = [0,0,0,0;1,0,0,0;0,1,0,0;0,0,1,1];
    C = [0,0,0,0;0,0,0,0;0,0,0.42,0;0,0,0,1];
    A = -log(5) * eye(4) - 2 * k / 3 * C;
    A1 = -log(5) * eye(4) - k * C;
    A2 = log(5)*eye(4);
    arr = [0 0 1.109e5/2 1.109e5];
    B  = 3 * arr * A2^(-1) * (eye(4) - expm(-A2/3));
    f = @(x) 1.22e11 * x / (1.22e11 + x);
    Y = T * expm(A) * X + [f(B * expm(2 / 3 * A1) * X);0;0;0];
    weight = [5.07,11.55,17.86,22.99];
    Z = weight * k * C * (A1)^(-1) * (-eye(4) + expm (2/3 * A1)) * X;
end

