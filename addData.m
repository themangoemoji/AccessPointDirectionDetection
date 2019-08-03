function [X, Y, access_points, amplitudes] = addData(X, Y, amplitudes, access_points, angles)
    for access_point = 1:access_points,
        x = amplitudes;
        shift = access_point - 1;
        x = circshift(x, [0, shift]); % rotate the matrix to perform 1 vs all. Do not rotate on first iteration i.e. circshift(x, [0,0])

        weighted_target = x(:, 1) * 50; % Bias the targeted AP
        remaining_rows = x(:, [2:end]);
        x = [weighted_target, remaining_rows];
        x = [1, x(:)']; % Add bias feature
        X = [X; x];

        y = circshift(angles, [0, shift])(end, 1);
        Y = [Y; y];
    end
end
