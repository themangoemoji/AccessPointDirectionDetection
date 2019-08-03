function J = computeCostMulti(X, y, theta)

    % Cost
    J = 0;
    m = length(y); % number of training examples

    % Error
    SSE = sum(((X * theta) - y) .^ 2);
    J = (1 ./ (2 * m)) * SSE;

end
