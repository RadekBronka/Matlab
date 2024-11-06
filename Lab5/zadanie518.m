clear all; close all;
img = imread('Lena256.bmp');
figure; imshow(img); % Wyświetlenie oryginalnego obrazu

[M, N] = size(img);
[X, Y] = meshgrid(1:M, 1:N);

% Ustawienie współrzędnych dla interpolacji
[Xi, Yi] = meshgrid(M/2-20 : 0.025 : M/2+20, N/2-20 : 0.025 : N/2+20);

% Interpolacja przed obrotem
img1 = uint8(interp2(X, Y, double(img), Xi, Yi, 'nearest', NaN));
img2 = uint8(interp2(X, Y, double(img), Xi, Yi, 'linear', NaN));
img3 = uint8(interp2(X, Y, double(img), Xi, Yi, 'spline', NaN));
img4 = uint8(interp2(X, Y, double(img), Xi, Yi, 'cubic', NaN));

% Resize
img1_resized = imresize(img1, [M, N]);
img2_resized = imresize(img2, [M, N]);
img3_resized = imresize(img3, [M, N]);
img4_resized = imresize(img4, [M, N]);

% Wyświetlanie obrazów z interpolacjami
figure;
subplot(221); imshow(img1_resized); title('Nearest');
subplot(222); imshow(img2_resized); title('Linear');
subplot(223); imshow(img3_resized); title('Spline');
subplot(224); imshow(img4_resized); title('Cubic');
pause;

% Obliczanie błędu przed
mse1_before = mean((double(img) - double(img1_resized)).^2, 'all');
mse2_before = mean((double(img) - double(img2_resized)).^2, 'all');
mse3_before = mean((double(img) - double(img3_resized)).^2, 'all');
mse4_before = mean((double(img) - double(img4_resized)).^2, 'all');

fprintf('MSE dla metod interpolacji przed obrotem:\n');
fprintf('Nearest-neighbor: MSE = %.4f \n', mse1_before);
fprintf('Bilinear: MSE = %.4f \n', mse2_before);
fprintf('Spline: MSE = %.4f \n', mse3_before);
fprintf('Cubic: MSE = %.4f \n', mse4_before);

% Rotacja obrazu o zadany kąt
a = pi/6; % kąt rotacji
R = [cos(a) -sin(a); sin(a) cos(a)]; % macierz rotacji
for m = 1:M
    for n = 1:N
        work = R * [X(m, n); Y(m, n)]; % rotacja współrzędnych (x, y)
        XR(m, n) = work(1, 1); % podstawienie nowego x
        YR(m, n) = work(2, 1); % podstawienie nowego y
    end
end

% Współrzędne w obrębie- bez tego wyskakuje NaN
XR = min(max(XR, 1), M);
YR = min(max(YR, 1), N);

% Rotacja obrazu i interpolacja
imgR1 = interp2(X, Y, double(img1_resized), XR, YR, 'nearest', NaN);
imgR2 = interp2(X, Y, double(img2_resized), XR, YR, 'linear', NaN);
imgR3 = interp2(X, Y, double(img3_resized), XR, YR, 'spline', NaN);
imgR4 = interp2(X, Y, double(img4_resized), XR, YR, 'cubic', NaN);

% Wyświetlanie obróconych obrazów
figure;
subplot(221); imshow(uint8(imgR1)); title('Nearest (Rotated)');
subplot(222); imshow(uint8(imgR2)); title('Linear (Rotated)');
subplot(223); imshow(uint8(imgR3)); title('Spline (Rotated)');
subplot(224); imshow(uint8(imgR4)); title('Cubic (Rotated)');
pause;

% Obliczanie błędu MSE po obrocie
mse1_after = mean((double(img) - double(imgR1)).^2, 'all');
mse2_after = mean((double(img) - double(imgR2)).^2, 'all');
mse3_after = mean((double(img) - double(imgR3)).^2, 'all');
mse4_after = mean((double(img) - double(imgR4)).^2, 'all');

fprintf('\nMSE dla metod interpolacji po obrocie:\n');
fprintf('Nearest-neighbor: MSE = %.4f \n', mse1_after);
fprintf('Linear: MSE = %.4f \n', mse2_after);
fprintf('Spline: MSE = %.4f \n', mse3_after);
fprintf('Cubic: MSE = %.4f \n', mse4_after);

