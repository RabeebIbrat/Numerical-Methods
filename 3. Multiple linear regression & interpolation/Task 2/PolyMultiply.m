function [product, success] = PolyMultiply (poly1, poly2)
  %CUSTOM
  %poly = p(1) + p(2)x^1 + ... + p(n+1)x^n
  success = 1;
  if size(poly1,2) == 1
    poly1 = poly1';
  endif
  if size(poly2,2) == 1
    poly2 = poly2';
  endif
  if size(poly1,1) > 1
    printf('Invalid dimension of poly1\n');
    success = 0;
  endif
  if size(poly2,1) > 1
    printf('Invalid dimension of poly2\n');
    success = 0;
  endif
  if success == 1
    while size(poly1,2) > 0 && poly1(end) == 0
      poly1(end) = [];
    endwhile
    while size(poly2,2) > 0 && poly2(end) == 0
      poly2(end) = [];
    endwhile
    product = zeros(1,size(poly1,2) + size(poly2,2)-1);
    for i = 1:size(poly1,2)
      for j = 1:size(poly2,2)
        product(i+j-1) .+= poly1(i) * poly2(j);
      endfor
    endfor
    if min(size(product) == 0)
      product = [0];
    endif
  endif
  if success == 0
    product = [];
  endif
endfunction
