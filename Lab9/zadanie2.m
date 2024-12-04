clear all; close all;

it = 12;
a  = pi-pi/5; b=pi+pi/5;  % znajdz zero funkcji y=sin(x) dla x=pi
f  = @(x) sin(x);         % definicja funkcji
fp = @(x) cos(x);         % definicja pochodnej funkcji
tol=0.001*pi;
z=pi;

% Tworzenie okna z wieloma wykresami
figure;

disp("sinus");
cb = nonlinsolvers( f, fp, a, b, 'bisection', it, tol, z);
cr = nonlinsolvers( f, fp, a, b, 'regula-falsi', it, tol, z);
cn = nonlinsolvers( f, fp, a, b, 'newton-raphson', it, tol, z);

subplot(2, 2, 1); % Tworzymy 2x2 siatkę, pierwszy wykres
plot(1:it, cb, 'o-', 1:it, cr, '*', 1:it, cn, '^-');
xlabel('iter'); title('c(iter) dla sin(x)'); 
grid on; legend('Bisection', 'Regula-Falsi', 'Newton-Raphson');

% Definicje dla funkcji kwadratowych
a = 0.5; % współczynnik kwadratowy
c = 0; % współczynnik wolny
z = 0;
it = 16;
a0 = -1;
b0 = 2;
tol1 = 0.001;

% Różne wartości b
b_values = [5.67, 1, 0.087];

for idx = 1:length(b_values)
    b = b_values(idx);
    f = @(x) a*x.^2 + b*x + c;
    fp = @(x) 2*a*x + b;

    disp(['kwadratowa, b=', num2str(b)]);
    cb = nonlinsolvers(f, fp, a0, b0, 'bisection', it, tol1, z);
    cr = nonlinsolvers(f, fp, a0, b0, 'regula-falsi', it, tol1, z);
    cn = nonlinsolvers(f, fp, a0, b0, 'newton-raphson', it, tol1, z);

    subplot(2, 2, idx + 1); % Kolejne wykresy w siatce 2x2
    plot(1:it, cb, 'o-', 1:it, cr, '*', 1:it, cn, '^-');
    xlabel('iter'); 
    title(['c(iter), b=', num2str(b)]);
    grid on; 
    legend('Bisection', 'Regula-Falsi', 'Newton-Raphson');
end
