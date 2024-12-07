% Define ranges for frequency, permeability, and permittivity
frequencies = logspace(4, 9, 100); % Frequency range from 10 kHz to 1 GHz
mu_r = 1; % Relative permeability (constant)
epsilon_r = 1; % Relative permittivity (constant)

mu_0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
epsilon_0 = 8.854e-12; % Permittivity of free space (F/m)

% Calculate permeability and permittivity
mu = mu_0 * mu_r; % Permeability in H/m
epsilon = epsilon_r * epsilon_0; % Permittivity in F/m

% Calculate skin depth for each frequency
skin_depth = 1 ./ sqrt(pi * frequencies * mu * epsilon);

% Plot frequency vs. skin depth
figure;
loglog(frequencies, skin_depth, 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Skin Depth (m)');
title('Skin Depth vs Frequency');
grid on;
