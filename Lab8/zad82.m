clear all; close all;

N = 1000;
% Elipsa - symetryczna macierz kowariancji elipsy
S = [ 1   0.5; ...                 % do zmiany 
     0.5   1 ];                   % Na przekątnej wieksze wartości- elipsa się rozciąga
                                   % wartości poza przekątną to
                                   % grubość(więcej- mniejsza)
                                   % elipsy

% Wywołanie funkcji elipsa
[x, V, phi, xR] = elipsa(S, 1, N);


figure; plot(x(1,:), x(2,:), 'ro'); grid; hold on;
x = x .* (2*(rand(1,N)-0.5)); % po to żeby wszystkie punkty nie były na elipsie
%x = x .* (0.33*(randn(1,N)));

plot(x(1,:), x(2,:), 'b*'); grid; 
xlabel('x'); ylabel('y'); title('Circle/Ellipse'); grid; axis square

figure; plot(xR(1,:), xR(2,:), 'ro'); grid; hold on;
xR = xR .* (2*(rand(1,N)-0.5)); % po to żeby wszystkie punkty nie były na elipsie
plot(xR(1,:), xR(2,:), 'b*'); grid; 
xlabel('x'); ylabel('y'); title('Circle/Ellipse R'); grid; axis square

function [u, V, phi, uR] = elipsa(S, r, N)
    [V, D] = eig(S);               % EVD
    alfa = linspace(0, 2*pi, N);   % kąty okręgu
    v = [cos(alfa); sin(alfa)];  
    u = V * sqrt(r * D) * v;       % Transformacja punktów okręgu na elipsę
    phi = atan2(V(2, 1), V(1, 1)); % Kąt
    R = [cos(phi), sin(phi); 
        -sin(phi), cos(phi)];
    uR = R * sqrt(r * D) * v;  
end
