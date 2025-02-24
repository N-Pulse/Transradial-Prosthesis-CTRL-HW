a = 4e-6;
J = 0.498e-7;
Km = 0.00966;
Rm = 14.6;
Lm = 5.02e-4;

% Plage des valeurs de L et C
L_min = 1e-6;
L_max = 5e-4;
C_min = 1e-6;
C_max = 5e-4;

% Résolution pour L et C
L_values = [1e-5, 1e-6]; % 5 valeurs entre L_min et L_max
C_values = [1e-5, 1e-6]; % 5 valeurs entre C_min et C_max

% Préparation de la figure
figure;
hold on;
grid on;
title('Diagrammes de Bode pour différentes combinaisons de L et C');
xlabel('Fréquence (Hz)');
ylabel('Gain et phase');

% Liste des labels pour la légende
legendEntries = {};

% Boucles sur L et C
for L = L_values
    for C = C_values
        % Numérateur et dénominateur de la fonction de transfert
        num = [J, a];
        den = [L*C*Lm*J, L*C*(Lm*a + Rm*J), (2*L*J + L*C*(Rm*a + Km*Km) + Lm*J), ...
               (Lm*a + Rm*J + 2*L*a), (Km*Km + Rm*a)];
        
        % Fonction de transfert
        Hs = tf(num, den);
        
        % Tracer le diagramme de Bode
        [mag, phase, w] = bode(Hs); % Obtenir les données de Bode
        mag = squeeze(mag); % Réduire les dimensions pour le gain
        phase = squeeze(phase); % Réduire les dimensions pour la phase
        f = w / (2*pi); % Convertir les pulsations en fréquences (Hz)
        
        % Tracer gain et phase sur le même graphe
        subplot(2, 1, 1); % Gain
        semilogx(f, 20*log10(mag)); 
        hold on;
        subplot(2, 1, 2); % Phase
        semilogx(f, phase); 
        hold on;

        % Ajouter une entrée dans la légende
        legendEntries{end+1} = sprintf('L=%.2e, C=%.2e', L, C);
    end
end

% Ajouter les légendes
subplot(2, 1, 1);
legend(legendEntries, 'Location', 'best');
title('Gain (dB)');
ylabel('Gain (dB)');
grid on;

subplot(2, 1, 2);
legend(legendEntries, 'Location', 'best');
title('Phase (deg)');
xlabel('Fréquence (Hz)');
ylabel('Phase (deg)');
grid on;

hold off;
