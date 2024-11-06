% interp_circle.m
% x(i) = ax0 + ax1*i^1 + ax2*i^2 + ... + axN*i^N
% y(i) = ay0 + ay1*i^1 + ay2*i^2 + ... + ayN*i^N
clear all; close all;

N = 6;                    % stopień wielomianów
i  = (0 : N)';            % zmienna "i" wielomianu w węzłach ("rzadka") 
xi = cos( 2*pi/N * i );   % wartości funkcji x = kosinus w węzłach
yi = sin( 2*pi/N * i );   % wartości funkcji y = sinus w węzłach
disp([ i, xi, yi ]);% sprawdzenie wartości

X = vander(i);     % wygenerowanie i pokazanie macierzy Vandermonde'a

ax = inv(X) * xi;         % obliczenie współczynników wielomianu dla x
ay = inv(X) * yi;         % obliczenie współczynników wielomianu dla y

id = 0 : 0.01 : N;        % zmienna "i" dokładna 
xd = cos( 2*pi/N * id );  % dokładne wartości x
yd = sin( 2*pi/N * id );  % dokładne wartości y

% Wartości interpolowane wielomianami
xi_interp = polyval(ax, id);
yi_interp = polyval(ay, id);

 mse_x = mean((xi_interp - xd).^2);
 mse_y = mean((yi_interp - yd).^2);
 mse_total = (mse_x + mse_y) / 2; % Średni błąd dla obu osi

figure;
plot(xi, yi, 'ko', xd, yd, 'r--', polyval(ax, id), polyval(ay, id), 'b.-');
xlabel('x'); ylabel('y'); title('y = f(x)'); axis square; grid;

figure;
plot(i, xi, 'ko', id, xd, 'r--', id, polyval(ax, id), 'b.-');
xlabel('i'); ylabel('x'); title('x = f(i)'); grid;

