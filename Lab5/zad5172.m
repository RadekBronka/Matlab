% interp_obiekt3D.m
clear all; close all;

%load('X.mat');
 load('babia_gora.dat'); X=babia_gora;

figure; grid; plot3( X(:,1), X(:,2), X(:,3), 'b.' ); pause

x = X(:,1); y = X(:,2); z = X(:,3);            % pobranie x,y,z
xvar = min(x) : (max(x)-min(x))/200 : max(x);  % zmiennosc x
yvar = min(y) : (max(y)-min(y))/200 : max(y);  % zmiennosc y


half_x = X(1:2:121,1); half_y = X(1:2:121,2); half_z = X(1:2:121,3); %tworzę macierze co drugiego punktu- do sprawdzenia błędu interpolacji
Missing = X(2:2:120,:); %macierz tych punktów

half_x_var = min(half_x) : (max(half_x)-min(half_x))/200 : max(half_x); %Wychodzi na to samo co xvar
half_y_var = min(half_y) : (max(half_y)-min(half_y))/200 : max(half_y); %Wychodzi na to samo co yvar
[Xi,Yi] = meshgrid( xvar, yvar );              % siatka interpolacji xi, yi
[half_Xi,half_Yi] = meshgrid(half_x_var, half_y_var);


for(i={'nearest', 'linear','cubic', 'spline'})
error_sum=0;
out = griddata(half_x, half_y, half_z, half_Xi, half_Yi, i{1} );     % interp: nearest, linear, spline, cubic
figure; surf( out); pause                     % rysunek             
figure; mesh( out ); pause                     % rysunek   

[M,N] = size(X);
rounded_xvar = round(xvar,4); % Zaokraglenie zeby funkcja find dzialala
rounded_yvar = round(yvar,4);
for i = 1:M
   x_var_index = find(rounded_xvar == X(i,1));
   y_var_index = find(rounded_yvar == X(i,2));
   original_value = X(i, 3); 
   error_sum = error_sum + abs(out(y_var_index, x_var_index) - original_value);
end

error_sum,


end
