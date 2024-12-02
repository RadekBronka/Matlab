function C = nonlinsolvers(f, fp, a, b, solver, iter,tol)

C = zeros(1,iter);    % kolejne oszacowania miejsca zerowego 
c = a;                % pierwsze oszacowanie
found=0;
for i = 1 : iter
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  switch(solver)
    case 'bisection',
        if( fa*fc<0 ) b=c; else a=c; end
        c = (a+b)/2;
        if ((abs((a-b)/2)<tol)&&found==0)
                fprintf('Metoda %s: osiągnięto tolerancję %f w iteracji %d\n', solver, tol, i);
                found=1;
        end
    case 'regula-falsi',
        if( fa*fc<0 ) b=c; else a=c; end
        c = b-fb*(b-a)/(fb-fa);
    case 'newton-raphson',
        c = c-fc/fpc;
  otherwise,
      error('Brak metody');
  end
  C(i)=c;  % zapamietaj
end
