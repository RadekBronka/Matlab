%Problem 2.16 (*** Wska ́znik uwarunkowania dla rozwi  ̨azania równania kwdra-
%towego). Sam wyprowad ́z równanie (2.26). Napisz program sprawdzaj  ̨acy to równa-
%nie. Oblicz sredni  ̨a (  ́ mean()) oraz odchylenie standardowe (std()) wartosci  ́ x1, ob-
%liczonej ze wzoru 2.12, dla: 
% a=0.5, 
% jednej wybranej wartosci  ́ c=0.490 : 0.001: 0.500; 
% oraz dla wielu wartosci  ́ b=1+0.001*randn(1,1000). 
% Powtórz eksperyment dla 2-3 róznych warto  ̇ sci  ́ c oraz porównaj otrzymane wartosci  ́ x1 (ich sred-  ́
%nie oraz rozrzuty).
clearvars;
a=0.5;


%losowanie wartosci b, zapis do macierzy
b=1+0.001*randn(1,1000);
for c=[0.492, 0.494, 0.495]

    results=zeros(1,1000);
    cond=zeros(1,1000);
    for i=1:1000
        delta=b(i)^2-4*a*c;
        cond(i)=b(i)/sqrt(delta);
        x1=(-b(i)-sqrt(delta))/(2*a);
        results(i)=x1;
    end
    display=['Wartosc c: ' ,num2str(c), ', Srednia: ',num2str(mean(results)), ', Odchylenie standardowe: ',num2str(std(results))];
    disp(display)
end