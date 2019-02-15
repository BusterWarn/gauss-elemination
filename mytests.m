% mytests:      test generator for myproblem, mygauss and mycheck.
% course:       Linear algebra
% author:       Buster Hultgren Wärn - dv17bhn@cs.umu.se
% written:      2019-02-15
function mytests(nrTests)

    for i = 1 : nrTests
        [A, b] = myproblem(randi(10) + 2, randi(10) + 2);
        x = mygauss(A, b);
        y = mycheck(A, b, x);
        fprintf("Test %i is succesfull: %i\n", i, y);
    end
end