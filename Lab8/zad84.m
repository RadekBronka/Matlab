clear all; close all;

% Definicja macierzy symetrycznej 4x4
A = [4, 1, 2, 3; 
     1, 5, 3, 4; 
     2, 3, 6, 5; 
     3, 4, 5, 7]; % Przykład macierzy symetrycznej
disp('Macierz początkowa:');
disp(A);

% Rozmiar macierzy
[N, ~] = size(A);
Rfinal = eye(N); %maceirz jednostkowa na początek do pierwszego mnożenia z R1- maceirz jednostkowa * macierz nie zmienia jej wartości

% Tolerancja zerowania (warunek zakończenia) (gdy szuka ad będą zera to
% nieskończona pętla)
tol = 1e-8;
counter=0;
% Iteracyjny proces redukcji, oparte na kodzie z wykladu
while true
    % Znalezienie największego elementu poza przekątną
    maxVal = max(abs(triu(A, 1)), [], 'all'); % Maksymalny element w górnej części macierzy (A,1)- maceirz A bez pierwszej przekątnej
    %max(abs(a), [], 'all') wartość maksymalna wśród wszystkich elementów abs(a)
    [p, q] = find(abs(triu(A, 1)) == maxVal, 1);    % Znajdź wiersz i kolumnę tego elementu
    if maxVal < tol
        break; % Jeżeli wszystkie elementy poza przekątną są bliskie zera- koniec dzialania
    end
    
   
    
    % Element algorytmu Jacobiego - zerowanie elementu A(p,q)
    xi = (A(q, q) - A(p, p)) / (2 * A(p, q));        
    if xi > -eps
        t = (abs(xi) + sqrt(1 + xi^2));
    else
        t = -(abs(xi) + sqrt(1 + xi^2));
    end
    c = 1 / sqrt(1 + t^2);
    s = t * c;
    
    % Macierz rotacji
    R = eye(N);
    R(p, p) = c; R(q, q) = c;
    R(p, q) = -s; R(q, p) = s;
    
    % Aktualizacja macierzy A  (wartości własne)
    A = R.' * A * R;
    %aktaulizacja macierzy Rfinal (wektory własne w kolumnach)
    Rfinal=Rfinal*R

    
    % Wyświetlenie aktualnego stanu macierzy
    disp('Aktualna macierz A po rotacji:');
    disp(A);
    counter= counter+1;
end

disp('Macierz po przekształceniu:');
disp(A);
disp(Rfinal);
counter,

%metoda Jacobiego to metoda znajdowania wartości własnych i wektorów
%własnych macierzy symetrycznych
%kroki:
%1.wybór największej wartości poza przekątną
%2.obliczenie kąta roatacji s=t*c, gdzie c to cos a s to sinus fi
%3.budowa macierzy rotacji
%4.aktualizacja macierzy A... A'=R^T*A*R- ta operacja zeruje A(p,q)
