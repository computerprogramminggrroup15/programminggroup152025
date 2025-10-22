% secant_recursive.m
function secant_recursive()
    fprintf('=== Secant Method (Recursive) ===\n');
    tic;
    
    % Parameters
    f = @(x) x^3 - x - 2;
    x0 = 1;
    x1 = 2;
    err = 5e-4;
    max_iter = 100;
    
    % Recursive secant
    x = secant_recursive_func(f, x0, x1, err, max_iter, 1);
    
    % Results
    time_taken = toc;
    xref = fzero(f, 1.6);
    
    fprintf('Root: %.4f\n', x);
    fprintf('Reference root: %.4f\n', xref);
    fprintf('Computation time: %.4f seconds\n', time_taken);
    fprintf('Error: %.6f\n', abs(x - xref));
    
    % Save results
    save("secant_recursive.mat", "x", "time_taken", "xref");
end

function x = secant_recursive_func(f, x0, x1, err, max_iter, iter)
    % Check maximum iterations
    if iter > max_iter
        warning('Maximum iterations reached');
        x = NaN;
        return;
    end
    
    % Secant iteration
    f0 = f(x0);
    f1 = f(x1);
    x_new = x1 - f1*(x1 - x0)/(f1 - f0);
    
    fprintf('Iteration %d: x = %.4f\n', iter, x_new);
    
    % Check convergence
    if abs(x_new - x1) < err
        x = x_new;
    else
        x = secant_recursive_func(f, x1, x_new, err, max_iter, iter + 1);
    end
end