% evd_power.m
clear all; close all;

if(1) A = [ 4 0.5; 0.5 1 ];       % wybor/definicja symetrycznej macierzy kwadratowej
else  A = magic(4);
end
[ N, N ] = size(A);               % wymiar 

x = ones(N,1);                    % inicjalizacja
for i = 1:20                      % poczatek petli
    y = A*x;                      % pierwsze mnozenie
    [ymax,imax] = max(abs(y));    % najwieksza wartosc abs() i jej indeks
    x = y/ymax;                   % wektor wlasny (noramlizaca wektora y przez największą wartość bezwzględną)
    lambda = ymax;                % wartosc wlasna ymax=y(imax)
    
end                               % koniec petli
%x = x / norm(x); %normalizacja x w formie euklidesowej tak jak w funkcji eig
x, lambda,                        % pokaz wynik: max wartosc wlasna i wektor wlasny
[ V, D ] = eig(A)                 % porownaj z funkcja Matlaba
    
    
    













%dlaczego inaczej?
%inna normalziacja w eig
