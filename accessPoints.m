function g = decay(z)
    g = zeros(size(z));
    g = 1 ./ (1 - exp(-z));
end

distances = [0.3:.1:3];
amplitude = sigmoid(distances);
plot(amplitude, distances);
