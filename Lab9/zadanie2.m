% equnonlin_solve.m
clear all; close all;

it = 12;
a  = pi-pi/5; b=pi+pi/5;  % znajdz zero funkcji y=sin(x) dla x=pi
f  = @(x) sin(x);         % definicja funkcji
fp = @(x) cos(x);         % definicja pochodnej funkcji
tol=0.001*pi;
z=pi;
disp("sinus");
cb = nonlinsolvers( f, fp, a, b, 'bisection', it,tol,z,b);
cr = nonlinsolvers( f, fp, a, b, 'regula-falsi', it,tol,z,b);
cn = nonlinsolvers( f, fp, a, b, 'newton-raphson', it,tol,z,b);
figure; plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-'); xlabel('iter'); title('c(iter)')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson');

a = 0.5; % współczynnik kwadratowy
c = 0; % współczynnik wolny
z=0;
it=16;
a0=-1;
b0=2;
tol1=0.001;
b=5.67; % różne wartości b
f=@(x) a*x.^2+b*x+c;
fp=@(x) 2*a*x +b;


disp("kwadratowa, b=5.67");
cb = nonlinsolvers(f, fp, a0, b0, 'bisection', it,tol1,z,b);
cr = nonlinsolvers(f, fp, a0, b0, 'regula-falsi', it,tol1,z,b);
cn = nonlinsolvers(f, fp, a0, b0, 'newton-raphson', it,tol1,z,b);

figure; plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-'); xlabel('iter'); title('c(iter), b=5.67')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson');

b=1; % różne wartości b
f=@(x) a*x.^2+b*x+c;
fp=@(x) 2*a*x +b;


disp("kwadratowa, b=1");
cb = nonlinsolvers(f, fp, a0, b0, 'bisection', it,tol1,z,b);
cr = nonlinsolvers(f, fp, a0, b0, 'regula-falsi', it,tol1,z,b);
cn = nonlinsolvers(f, fp, a0, b0, 'newton-raphson', it,tol1,z,b);

figure; plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-'); xlabel('iter'); title('c(iter), b=1')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson');

b=0.087; % różne wartości b

c=-1;
f=@(x) a*x.^2+b*x+c;
fp=@(x) 2*a*x +b;


disp("kwadratowa, b=0.087");
cb = nonlinsolvers(f, fp, a0, b0, 'bisection', it,tol1,z,b);
cr = nonlinsolvers(f, fp, a0, b0, 'regula-falsi', it,tol1,z,b);
cn = nonlinsolvers(f, fp, a0, b0, 'newton-raphson', it,tol1,z,b);

figure; plot( 1:it,cb,'o-', 1:it,cr,'*', 1:it,cn,'^-'); xlabel('iter'); title('c(iter), b=0.087')
grid on, legend('Bisection','Regula-Falsi','Newton-Raphson');
