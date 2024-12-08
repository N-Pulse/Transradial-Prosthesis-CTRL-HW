a = 4e-6;
J = 0.01;
C = 0.1e-6;
% L = 63e-3;
L = 100e-3;
Km = 0.00533;
Rm = 60;
Lm = 1e-4;

num = [J,  a];
den = [L*C*Lm*J,  L*C*(Lm*a + Rm*J),  (L*J + L*C*Rm*a + Lm*J),  (Lm*a + Rm*J + L*a),  (Km*Km + Rm*a)];

Hs = tf(num, den);

% Analyse des pôles
disp('Pôles de la fonction de transfert:');
poles = pole(Hs);
disp(poles);

% Analyse des zéros
zeros = zero(Hs);
disp('Zéros de la fonction de transfert:');
disp(zeros);

figure;
bode(Hs);

% Calcul de la bande passante et fréquence de coupure
bw = bandwidth(Hs); % wc: pulsation (rad/s), bw: bande passante (Hz)
wc = 2*pi*bw;

fprintf('Pulsation de coupure (MATLAB): %.2f rad/s\n', wc);
fprintf('Fréquence de coupure (MATLAB): %.2f Hz\n', bw);


