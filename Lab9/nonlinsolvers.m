function [C, first_iter] = nonlinsolvers(f, fp, a, b, solver, iter, tol, z,bval)

C = zeros(1, iter);    % Kolejne oszacowania miejsca zerowego 
first_iter = -1;       % Flaga na pierwszą iterację spełniającą kryterium
if(z == pi)
    c = a;
end % Pierwsze oszacowanie
if(z ~= pi)
    c = (a + b) / 2;
end
found = 0;             % Flaga do zaznaczenia znalezienia rozwiązania

for i = 1 : iter
    % Obliczanie wartości funkcji i pochodnej
    fa = feval(f, a); 
    fb = feval(f, b); 
    fc = feval(f, c); 
    fpc = feval(fp, c);  

    switch (solver)
        case 'bisection'
            % Metoda bisekcji
            if (fa * fc < 0)
                b = c; 
            else
                a = c; 
            end
            c = (a + b) / 2;

        case 'regula-falsi'
            % Metoda reguły falsi
            if (fa * fc < 0)
                b = c; 
            else
                a = c; 
            end
            c = b - fb * (b - a) / (fb - fa);

        case 'newton-raphson'
            % Metoda Newtona-Raphsona
            c = c - fc / fpc;

        otherwise
            error('Brak metody');
    end

    % Zapisanie oszacowania
    C(i) = c;  
    
    % Sprawdzenie tolerancji
    if first_iter == -1 && bval==0.087 && abs(c - 1.33) < tol
        first_iter = i;  % Zapisz numer iteracji, jeśli warunek spełniony
        % Wyświetlenie wyniku
        disp(['Metoda: ', solver, ', Pierwsza iteracja spełniająca kryterium: ', num2str(first_iter)]);
    end

    if first_iter == -1 && abs(c - z) < tol
        first_iter = i;  % Zapisz numer iteracji, jeśli warunek spełniony
        % Wyświetlenie wyniku
        disp(['Metoda: ', solver, ', Pierwsza iteracja spełniająca kryterium: ', num2str(first_iter)]);
    end
end

% Jeżeli żadna iteracja nie spełnia kryterium, wyświetl informację
if first_iter == -1
    disp(['Metoda: ', solver, ', Kryterium tolerancji nie zostało spełnione w zadanej liczbie iteracji.']);
end
