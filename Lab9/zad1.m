% equnonlin_balista.m
clear all; close all;

m=5; v0=50; alpha=30; h=50; g=9.81; b=0.47;
alpha = alpha/180*pi;
x = 0 : 1 : 350;
%x = 320 : 0.001 : 330;
y = h + tan(alpha)*x - g / (2*v0^2*cos(alpha)) * x.^2;
y2 = h + x.*(tan(alpha) + (m*g)/(b*v0*cos(alpha))) + ((g*m^2)/(b^2))*log(1-(x*b)/(m*v0*cos(alpha)));


figure; plot(x,y); xlabel('x'); ylabel('y'); title('y(x)'); grid;
figure; plot(x,y2); xlabel('x'); ylabel('y'); title('y2(x)'); grid;
