% equnonlin_solve.m
clear all; close all;

it = 12;
a  = pi-pi/5; b=pi+pi/5;  % znajdz zero funkcji y=sin(x) dla x=pi
f  = @(x) sin(x);         % definicja funkcji
fp = @(x) cos(x);         % definicja pochodnej funkcji
tol=0.001*pi;
x = 0 : 0.01 : 2*pi;

%sinus
disp("Sinus")
cb = nonlinsolvers( f, fp, a, b, 'bisection', it,tol );
cr = nonlinsolvers( f, fp, a, b, 'regula-falsi', it,tol);
cn = nonlinsolvers( f, fp, a, b, 'newton-raphson', it,tol);
figure; plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-'); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson');

%kwadratowa
%funkcja 2   kwadratowa   
% Nachylenia: 
% 45 stopni-> b=1
%5 stopni -> b=0.087
%80 stopni-> b=5.67
a = 1; % współczynnik kwadratowy
c = 1; % współczynnik wolny
b_values = [5.67,1,0.087]; % różne wartości b
it=20;
a0=-1;
b0=2;
tol1=0.001;

% Kolory dla wykresów
colors = {'r', 'g', 'b'}; % różne kolory dla różnych b
markers = {'o-', '*', '^-'}; % różne znaczniki dla metod

% Wykres funkcji kwadratowych
x = linspace(a0, b0, 100); % przedział dla wykresów funkcji
figure;
hold on;
for id = 1:length(b_values)
    b = b_values(id);
    f = @(x) a*x.^2 + b*x + c; % definicja funkcji
    plot(x, f(x), 'Color', colors{id}, 'DisplayName', sprintf('f(x) dla b=%.3f', b));
end

figure;
hold on;
disp("Kwadratowa")
for id=1:length(b_values);
    b=b_values(id); 
    f=@(x) a*x.^2+b*x+c;
    fp=@(x) 2*a*x +b;

    % Znajdowanie miejsc zerowych
    disp(b);
    cb = nonlinsolvers(f, fp, a0, b0, 'bisection', it,tol1);
    cr = nonlinsolvers(f, fp, a0, b0, 'regula-falsi', it,tol1);
    cn = nonlinsolvers(f, fp, a0, b0, 'newton-raphson', it,tol1);

    % Wykres zbieżności dla danej wartości b
    plot(1:it, cb, markers{1}, 'Color', colors{id}, 'DisplayName', sprintf('Bisection, b=%.3f', b));
    plot(1:it, cr, markers{2}, 'Color', colors{id}, 'DisplayName', sprintf('Regula-Falsi, b=%.3f', b));
    plot(1:it, cn, markers{3}, 'Color', colors{id}, 'DisplayName', sprintf('Newton-Raphson, b=%.3f', b));
end
    


xlabel('Iteracje');
ylabel('c(iter)');
title('Zbieżność metod iteracyjnych dla różnych wartości b');
grid on;
legend('show', 'Location', 'best'); % automatyczne generowanie legendy
hold off;
