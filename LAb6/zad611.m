% Definicja funkcji MATLAB: erf(x)
syms x;
f = erf(x);

% 1. Szereg Taylora dla funkcji erf(x)
n = 5; % Stopień rozwinięcia
taylor_series = taylor(f, x, 'Order', n);

% Wyświetlenie szeregu Taylora
disp('Szereg Taylora dla erf(x):');
disp(taylor_series);

% Aproksymacja Padé
y=pade(f);
hold on;
fplot(y,[-3,3],'b'); %pade
fplot(f,[-3,3],'r'); %og
fplot(taylor_series,[-3,3]);
hold off;
