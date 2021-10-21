function [result, iterations] = secant_method (func, guess1, guess2, err, max_iter)
  x1 = guess1;
  x2 = guess2;
  for i = 1:max_iter
    xnew = func(x2);
    xnew = x2 - (x1 - x2)/(func(x1)-xnew)*xnew;
    x1 = x2;
    x2 = xnew;
    base = x2;
    if(base == 0)
      base += err*0.01;
    endif
    errnow = abs((x2-x1)/base);
    if errnow <= err
      break
    endif
  endfor
  result = x2;
  iterations = i;
endfunction
