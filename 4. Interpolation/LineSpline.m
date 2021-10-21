function [P2, success] = LineSpline (P)
  %CUSTOM
  %P(i) = (x_i,y_i)
  if size(P,2) == 2 && size(P,1) > 1
    P2 = P;
    success = 1;
  else
    printf('Error in LineSpline: Invalid dimension of P\n');
    P2 = [];
    success = 0;
  endif
endfunction
