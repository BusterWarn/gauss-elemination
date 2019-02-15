% mycheck:      Checks if x solves Ax=b. If so, return 1, else 0.
% course:       Linear algebra
% author:       Buster Hultgren Wärn - dv17bhn@cs.umu.se
% written:      2019-02-15
function equals = mycheck(A, b, x)

    [m, n] = size(A);
    equals = 1;
    tol = 1.e-12;

    %If Ax is not defined.
    if size(x) ~= n
        equals = 0;
        return;
    end

    %Checks if Ax=b.
    for i = 1 : m
        rowsum = 0;
        for j = 1 : n

            rowsum = rowsum + A(i, j) * x(j);
        end
        
        if rowsum - b(i) > tol
            equals = 0;
            break
        end
    end
end