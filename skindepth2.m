% Constants
mu_0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
mu_r_avg = 8.42e-3;    % Average permeability from your calculation (cm/s, convert to m/s)
sigma = 1e-8;          % Assumed conductivity for construction materials (S/m)
f = linspace(1e12, 10e12, 1000); % Frequency range from 1 MHz to 1 GHz

% Skin depth calculation
delta = 1 ./ sqrt(pi * f * mu_0 * mu_r_avg * sigma);

% Plotting
figure;
plot(f/1e12, delta * 1); % Convert frequency to THz and depth to meters
xlabel('Frequency (THz)');
ylabel('Depth (m)');

title('Skin Depth vs Frequency for Construction Materials (Average Properties)');
grid on;
