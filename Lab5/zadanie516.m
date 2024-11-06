function B = B_j3(x, x_j)
    u = abs(x - x_j);
    if 1 <= (x - x_j) && (x - x_j) < 2
        B = (1 - u)^3 / 6;
    elseif 0 <= (x - x_j) && (x - x_j) < 1
        B = (3 * u^3 - 6 * u^2 + 4) / 6;
    elseif -1 <= (x - x_j) && (x - x_j) < 1
        B = (-3 * u^3 + 3 * u^2 + 3 * u + 1) / 6;
    elseif -2 <= (x - x_j) && (x - x_j) < -1
        B = u^3 / 6;
    else
        B = 0;
    end
end

% Parametry
x_j = 0;  % Węzeł centrowy
x_values = -3:0.01:3;  % Zakres wartości x
y_values = zeros(size(x_values)); 

for i = 1:length(x_values)
    y_values(i) = B_j3(x_values(i), x_j);
end
% Rysowanie wykresu
figure;
plot(x_values, y_values, 'b', 'LineWidth', 1.5);
xlabel('x');
ylabel('B_{j,3}(x)');
grid on;
