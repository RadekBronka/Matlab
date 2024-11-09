% przedzial do wykresu
x = linspace(-1, 1, 100);

% C0(x) i C1(x)
C0 = ones(size(x)); % C0(x) = 1
C1 = x;             % C1(x) = x

% tablice do wykresu
C = zeros(11, length(x));
C(1, :) = C0;
C(2, :) = C1;

% tablice do wzorów
syms X;
C_sym = sym(zeros(11, 1));
C_sym(1) = 1;  % C0(x) = 1
C_sym(2) = X;  % C1(x) = x
%wielomiany
for n = 2:10
    C(n+1, :) = 2 * x .* C(n, :) - C(n-1, :); %do wykresu
    C_sym(n+1) = expand(2 * X * C_sym(n) - C_sym(n-1)); %do wzoru 
end

%wykres
figure;
hold on
for i = 1:10
    plot(x, C(i, :));
end
hold off
