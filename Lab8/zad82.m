% evd_elipsa.m
clear all; close all;

N = 1000;
% Elipsa - symetryczna macierz kowariancji elipsy
S = [ 100   100; ...                 % do zmiany 
     100   100 ];                   % Na przękątnej wieksze wartości- elipsa się rozciąga
                                   %wartości poza przekątną to
                                   %gurbość(więcej- mniejsza)
                                   %elipsy
[x,V,phi] = elipsa(S,1,N);
R= [cos(phi), sin(phi); 
   -sin(phi), cos(phi)],
figure; plot(x(1,:),x(2,:), 'ro'); grid; hold on;
x = x .* (2*(rand(1,N)-0.5));
%x = x .* (0.33*(randn(1,N)));
plot(x(1,:),x(2,:), 'b*'); grid; 
xlabel('x'); ylabel('y'); title('Circle/Ellipse'); grid; axis square

function [u,V,phi] = elipsa(S,r,N)
[V,D] = eig(S);                    % EVD
alfa = linspace(0,2*pi,N);         % katy okregu
v= [ cos(alfa); sin(alfa)];  
u = V*sqrt(r*D)*v;             %transformacja punktow okregu na elipse, str.165
phi = atan2(V(2,1), V(1,1)); % Kąt
end
