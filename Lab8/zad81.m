% evd_pca.m
% Separacja zrodel - nagrania
  clear all; close all;
   
  [x1,fpr1]=audioread('Canaphant.mp3'); x1=x1(:,1)';  % wczytaj nagrania z dwoch mikrofonow
  [x2,fpr2]=audioread('Canary.wav'); x2=x2(:,1)';  % tylko pierwszy kanal, zmien kierunek
  
  size(x1), size(x2), pause                      % pokaz wymiary wektorow
  
  N = min( length(x1), length(x2) ),      % dlugosc krotszego nagrania
  n = 1:N; x1=x1(1:N); x2=x2(1:N);        % pozostaw taka sama liczbe probeka 
  figure;
  subplot(211); plot(n,x1); title('x1(n)'); grid;   % pokaz oba
  subplot(212); plot(n,x2); title('x2(n)'); grid;   % nagrania
  %soundsc(x1(1:7*fpr1),fpr1), pause                 % odsluchaj oba 
  %soundsc(x2(1:3*fpr2),fpr2), pause                 % nagrania
 
% Separacja zrodel
  C1 = cov( x1, x2 ),                   % macierz kowariancji Matlaba
  x12 = [ x1-mean(x1); x2-mean(x2) ];   % odjecie wartosci srednich
  C2 = x12 * x12'/N,                    % macierz kowariancji Nasza
  %maceirz x macierz transponowana (2 x N, N x 2) wyjdzie macierz 2x2,
  %podzielona przez liczbę próbek w celu uśrednienia
  pause
  C = C2;  % C = C1 albo C2             % wybor macierzy
  [V,D] = eig(C2), pause                % dekompozycja EVD (C=VDV^T), obliczenie wektorów własnych (V- macierz wektorów własnych, D-macierz diagonalna wektorów własnych)
  y = V' * [ x1; x2 ];                  % PCA - rzutowanie na wektory wlasne, DEKORELACJA (z wykładu) (transpozycja macierzy wektorów własnych razy macierz danych wejściowych z mikrofonu)
  
  %Wektory własne są ortogonalne- rzutowanie na nie sprawia, że 
% Wynik separacji  
  figure;
  subplot(211); plot(n,y(1,:),'b'); title('y1(n)'); grid;
  subplot(212); plot(n,y(2,:),'b'); title('y2(n)'); grid;
  soundsc(y(1,:),fpr1), pause
  soundsc(y(2,:),fpr2), pause
