startPos=[30, 10];
endPos= [30, 200];
speed=20;
t=0:0.01:6;
BS=[140,50];
wall1start= [60, 40];
wall1end= [200, 40];
wall2start=[70,90];
wall2end=[180,90];
powermatrix=zeros(1,length(t));
frequency=2.4*10^9;
power=5;
lambda=(3*10^8)/(2.4*10^9);
reflection_coefficient = 0.7;


figure;
hold on;
% Ściana 1
plot([wall1start(1), wall1end(1)], [wall1start(2), wall1end(2)], 'r-', 'LineWidth', 2);
text((wall1start(1) + wall1end(1))/2, wall1start(2), 'Ściana 1', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

% Ściana 2
plot([wall2start(1), wall2end(1)], [wall2start(2), wall2end(2)], 'b-', 'LineWidth', 2);
text((wall2start(1) + wall2end(1))/2, wall2start(2), 'Ściana 2', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

% Rysowanie trasy użytkownika (od początkowej do końcowej pozycji)
plot([startPos(1), endPos(1)], [startPos(2), endPos(2)], 'g--', 'LineWidth', 1.5);

% Rysowanie stacji bazowej (BS)
plot(BS(1), BS(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % BS zaznaczone czerwonym kółkiem
text(BS(1), BS(2), 'BS', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
hold off;

%sprawdzenie sygnału bezpośredniego
for i = 1:length(t)
    position = [startPos(1), startPos(2) + speed * t(i)];
    if(dwawektory(position(1),position(2),BS(1),BS(2),wall1start(1),wall1start(2),wall1end(1),wall1end(2))==-1 && dwawektory(position(1),position(2),BS(1),BS(2),wall2start(1),wall2start(2),wall2end(1),wall2end(2))==-1)
        r=sqrt(((position(1)-BS(1))^2)+(position(2)-BS(2))^2);
        powermatrix(i) = power*(lambda/(4*pi*r))^2; % obliczenie mocy, musisz zdefiniować funkcję
    else
        powermatrix(i) = 0; % Jeśli sygnał jest blokowany, moc sygnału wynosi 0
    end


 % Sprawdzenie odbicia od ściany 1
    if dwawektory(position(1), position(2), BS(1), BS(2), wall1start(1), wall1start(2), wall1end(1), wall1end(2)) ~= -1
        reflected_distance1 = sqrt(((position(1) - wall1start(1))^2) + ((position(2) - wall1start(2))^2)) + ...
                                 sqrt(((wall1start(1) - BS(1))^2) + ((wall1start(2) - BS(2))^2));
        powermatrix(i) = powermatrix(i) + reflection_coefficient * (power * (lambda / (4 * pi * reflected_distance1))^2);
    end
    
    % Sprawdzenie odbicia od ściany 2
    if dwawektory(position(1), position(2), BS(1), BS(2), wall2start(1), wall2start(2), wall2end(1), wall2end(2)) ~= -1
        reflected_distance2 = sqrt(((position(1) - wall2start(1))^2) + ((position(2) - wall2start(2))^2)) + ...
                                 sqrt(((wall2start(1) - BS(1))^2) + ((wall2start(2) - BS(2))^2));
        powermatrix(i) = powermatrix(i) + reflection_coefficient * (power * (lambda / (4 * pi * reflected_distance2))^2);
    end
end


figure;
plot(powermatrix);
