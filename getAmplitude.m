function [amplitude, ap_angles] = get_amplitude(x, y, positions)
    ap_angles = -positions' + atan2(x,y);
    ap_angles;

    angle_amplitude = (1*cos(ap_angles));
    angle_amplitude_norm = angle_amplitude ./ norm(angle_amplitude);

    % This equation is is a parabola and one of many we could use for diminishing signal
    ap_distance_from_device = sqrt((y .^ 2) + (x .^ 2));

    %distance_amplitude = (-0.5 .* (ap_distance_from_device) .^ 2) + (-1 .* (ap_distance_from_device)) + 11;
    distance_amplitude = 10*(1-0.5) .^ ap_distance_from_device;
    distance_amplitude = repmat(distance_amplitude, length(positions), 1);
    distance_amplitude_norm = distance_amplitude./norm(distance_amplitude);
    amplitude = distance_amplitude_norm .+ angle_amplitude_norm;
end
