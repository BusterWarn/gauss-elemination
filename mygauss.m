% mygauss:      Solves the equation Ax=b. if A is mXn, b must me 1xm.
% course:       Linear algebra
% author:       Buster Hultgren Wärn - dv17bhn@cs.umu.se
% written:      2019-02-15
function [x] = mygauss(A, b)

    augm = [A,b];
    [m, n] = size(A);

    %If diagonal contains 0, swap rows.
    for i = 1 : n
        a = i;
        for j = i: m

            if A(j, i) ~= 0

                temp = augm(a, :);
                augm(a, :) = augm(j, :);
                augm(j, :) = temp;
                break
            end
        end
    end
    
    %Actual gauss elemination.
    for i = 1 : m
        if i > n
            if augm(i, n) == 0
                break;
            end
        elseif augm(i, i) == 0
            break;
        end
        augm(i, :) = augm(i, :) / augm(i, i);

        for j = 1 : m
            if j ~= i
                augm(j, :) = augm(j, :) - augm(j, i) * augm(i, :);
            end
        end
    end
    
    %Checks if augmented matrix is consistent - if it has answers.
    consistent = 0;
    for i = 1 : n
        if augm(m, i) ~= 0
            consistent = 1;
            break;
        end
    end
    if consistent == 0 && augm(m, n + 1) ~= 0
        x = -1;
    
    %If matrix is consistent, creates nx1 vector filled with answers.
    %Ignores general solutions by setting free variables to 0.
    else
        x = zeros(n, 1);
        nrSolutions = m;
        if m > n
            nrSolutions = n;
        end
        for i = 1 : nrSolutions
            x(i) = augm(i, n + 1);
        end
    end
end