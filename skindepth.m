% Constants
mu_0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
mu_r = 1;             % Relative permeability of soil
sigma = 0.01;         % Conductivity of soil (S/m)
f = linspace(1e6, 10e7, 1000); % Frequency range from 1 MHz to 100 MHz

% Skin depth calculation
delta = 1 ./ sqrt(pi * f * mu_0 * mu_r * sigma);

% Plotting
figure;
plot(f/1e6, delta * 1e3); % Convert frequency to MHz and depth to mm
xlabel('Frequency (MHz)');
ylabel('Skin Depth (mm)');
title('Skin Depth vs Frequency for Soil After Landslide');
grid on;
