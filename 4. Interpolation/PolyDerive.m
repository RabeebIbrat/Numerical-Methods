function [deriv, success] = PolyDerive (poly, derivNum = 1)
  %CUSTOM
  %poly = p(1) + p(2)x^1 + ... + p(n+1)x^n
  success = 1;
  if size(poly,2) == 1
    poly = poly'
  endif
  if size(poly,1) > 1
    printf('Error in PolyDerive: Invalid dimension of poly');
    success = 0;
  endif
  if success == 1
    while size(poly,2) > 0 && poly(end) == 0
      poly(end) = [];
    endwhile
    for dx = 1:derivNum
      for i = 1:size(poly,2)
        poly(i) *= (i-1);
      endfor
      if min(size(poly)) > 0
        poly(1) = [];
      else
        break;
      endif
    endfor
    if min(size(poly)) == 0
      poly = [0];
    endif
    deriv = poly;
  endif
  if success == 0
    deriv = [];
  endif
endfunction
