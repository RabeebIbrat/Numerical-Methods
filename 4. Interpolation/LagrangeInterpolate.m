function [poly, success] = LagrangeInterpolate (P)
  %CUSTOM
  %P(i) = (x_i,y_i)
  success = 1;
  if size(P,2) != 2 || size(P,1) < 2
    printf('Error in LagrangeInterpolate: Invalid dimension of P\n');
    success = 0;
  endif
  if success == 1
    product = [1];
    for i = 1:size(P,1)
      product = PolyMultiply(product, [-P(i) 1]);
    endfor
    for i = 1:size(P,1)
      numer = PolyDivide(product, [-P(i) 1]);
      X = P(:,1);
      X = X(i) .- X;
      X(i) = 1;
      denom = prod(X);
      if denom == 0
        printf('Error in SlopeGen: Identical values of X_i,X_j\n');
        success = 0;
        break;
      endif
      L(i,:) = numer .* (P(i,2)/denom);
    endfor
    poly = sum(L);
  endif
  if success == 0
    poly = [];
  endif
endfunction
