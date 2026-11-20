
function J = gps_cost(theta, sats, P, iono)
%GPS_COST Calculates the mean squared pseudorange error for GPS.

% Inputs:
%   theta is a 4x1 vector [x; y; z; b] in meters
%   sats: nx3 matrix of satellite ECEF positions in meters
%   P  is a nx1 vector of measured pseudoranges in meters
%   iono function handles returning ionospheric delays in meters

% Output:
%   J is the Mean squared pseudorange error in m^2

    % Receiver position and clock offset
    p = theta(1:3);
    b = theta(4);

    % Distance from each satellite to receiver
    distances = sqrt(sum((sats - p(:)').^2, 2));

    % ionospheric delay for each satellite
    I = iono(sats, p);

    % P_hat is the predicted pseudoranges found by adding the distance of
    % each sattelite to reciever with receivers position, and the clock
    % offset
    P_hat = distances + b + I;

    J = mean((P(:) - P_hat).^2);

end
