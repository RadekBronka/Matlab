%Problem 2.13 ((L)*(*) Badanie rozwi  ̨azania równania kwadratowego). Napisz
%program w Matlabie sprawdzaj  ̨acy powyzszy “przepis kulinarny” (za **).

%Równanie ax^2+bx+c=0
a=2.3;
b=15000;
c=1.6;
%Krok 0- delta
delta=b^2-4*a*c
%Krok 1: obliczenie x1,x2:
x1=(-b-sqrt(delta))/(2*a),
x2=(-b+sqrt(delta))/(2*a),
%Krok 2 wybór większej wartości bezwzglednej
if(abs(x1)>abs(x2))
    newx2 = 2*c /(-b-sqrt(delta)),
else
    newx1 = 2*c /(-b+sqrt(delta)),
end
%Robimy to po to, aby uniknąć odejmowania liczb o zblizonych wartosciach co
%spowodowałoby duży błąd wyniku (gdy b>>4ac)
