% Define ranges for frequency, permeability, and permittivity
frequencies = logspace(4, 9, 5); % Frequency range from 10 kHz to 1 GHz
mu_r_values = logspace(-1, 1, 50); % Relative permeability from 0.1 to 10
epsilon_r_values = logspace(0, 3, 50); % Relative permittivity from 1 to 1000

% Create a figure for 3D plots
figure;

% Loop through each frequency to create a surface plot
for k = 1:length(frequencies)
    freq = frequencies(k);
    mu_0 = 4 * pi * 1e-7; % Permeability of free space (H/m)

    % Create meshgrid for permeability and permittivity
    [mu_r_mesh, epsilon_r_mesh] = meshgrid(mu_r_values, epsilon_r_values);
    mu_mesh = mu_0 * mu_r_mesh; % Permeability in H/m
    epsilon_mesh = epsilon_r_mesh * 8.854e-12; % Permittivity in F/m

    % Calculate skin depth for each permeability and permittivity
    skin_depth_mesh = 1 ./ sqrt(pi * freq * mu_mesh .* epsilon_mesh);

    % Plot skin depth vs. permeability and permittivity for this frequency
    subplot(3, 2, k); % Create a subplot for each frequency
    mesh(mu_r_mesh, epsilon_r_mesh, skin_depth_mesh);
    xlabel('Relative Permeability (\mu_r)');
    ylabel('Relative Permittivity (\epsilon_r)');
    zlabel('Skin Depth (m)');
    title(sprintf('Skin Depth vs \mu_r and \epsilon_r at %d Hz', round(freq)));
    grid on;
end

% Adjust layout
sgtitle('Skin Depth as a Function of Frequency, Permeability, and Permittivity');