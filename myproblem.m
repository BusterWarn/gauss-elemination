% myproblem:    Generates a Matrix with mXn size, and a vector of size m.
%               Will be filled with random integers between -10 to 10.
% course:       Linear algebra
% author:       Buster Hultgren Wärn - dv17bhn@cs.umu.se
% written:      2019-02-15
function [A, b] = myproblem(m, n)

    A = randi([-10, 10], m, n);
    b = randi([-10, 10], m, 1);

end