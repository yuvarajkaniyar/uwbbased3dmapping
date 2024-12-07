% MATLAB Code for Skin Depth Calculation and Plot (Including Soil)

% Constants
mu_0 = 4 * pi * 1e-7;  % Permeability of free space (H/m)

% Conductivity (S/m)
sigma_copper = 5.96e7;
sigma_aluminum = 3.77e7;
sigma_iron = 1e7;
sigma_plastic = 1e-14;  % Very low conductivity for plastic
sigma_soil = 5e-3;      % Average conductivity for soil

% Relative permeability for iron
mu_r_iron = 1000;  % Iron has a higher relative permeability

% Frequency range (50 MHz to 2 GHz)
frequencies = linspace(50e6, 2e9, 500);

% Skin depth function
skin_depth = @(f, mu, sigma) 1 ./ sqrt(pi * f * mu * sigma);

% Calculate skin depths for different materials
skin_depth_copper = skin_depth(frequencies, mu_0, sigma_copper);
skin_depth_aluminum = skin_depth(frequencies, mu_0, sigma_aluminum);
skin_depth_iron = skin_depth(frequencies, mu_0 * mu_r_iron, sigma_iron);
skin_depth_plastic = skin_depth(frequencies, mu_0, sigma_plastic);
skin_depth_soil = skin_depth(frequencies, mu_0, sigma_soil);

% Convert frequencies to MHz and skin depth to micrometers for plotting
frequencies_mhz = frequencies / 1e6;
skin_depth_copper_um = skin_depth_copper * 1e6;
skin_depth_aluminum_um = skin_depth_aluminum * 1e6;
skin_depth_iron_um = skin_depth_iron * 1e6;
skin_depth_plastic_um = skin_depth_plastic * 1e6;
skin_depth_soil_um = skin_depth_soil * 1e6;

% Plotting
figure;
plot(frequencies_mhz, skin_depth_copper_um, 'b-', 'LineWidth', 2); hold on;
plot(frequencies_mhz, skin_depth_aluminum_um, 'g-', 'LineWidth', 2);
plot(frequencies_mhz, skin_depth_iron_um, 'r-', 'LineWidth', 2);
plot(frequencies_mhz, skin_depth_plastic_um, 'm-', 'LineWidth', 2);
plot(frequencies_mhz, skin_depth_soil_um, 'c-', 'LineWidth', 2);

% Labels and title
xlabel('Frequency (MHz)');
ylabel('Skin Depth (\mum)');
title('Skin Depth vs Frequency for Different Materials (Including Soil)');
legend('Copper', 'Aluminum', 'Iron', 'Plastic', 'Soil');
grid on;

