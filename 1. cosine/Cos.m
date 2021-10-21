function [result] = Cos (x, iteration)
%return the value of cos using Taylor series
  term = 1;
  div = 0;
  result = x*0;
  if iteration > 0
    result++;
  for i = 1:iteration-1
    div+=2;
    result += term = -term .* x .* x ./ div ./ (div-1);
  endfor
  endif
endfunction
