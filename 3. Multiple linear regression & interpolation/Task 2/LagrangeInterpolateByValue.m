function [Y success] = LagrangeInterpolateByValue (P, X)
  %CUSTOM
  %P(i) = (x_i,y_i)
  %X(i) = (x_i)
  %Y(i) = (y_i) for (x_i)
  success = 1;
  if size(X,2) > 1
    X = X';
  endif
  if size(X,2) > 1
    printf('Error in LagrangeInterpolateByValue: val is neither an array, nor a vector\n');
    success = 0;
  elseif size(P,2) != 2 || size(P,1) < 2
    printf('Error in LagrangeInterpolateByValue: Invalid dimension of P\n');
    success = 0;
  endif
  if success == 1
    for i = 1:size(X,2)
      for j = (i+1):size(X,2)
        if X(i) == X(j)
          success = 0;
          printf('Error in LagrangeInterpolateByValue: Identical values of X_i,X_j\n');
          break;
        endif
      endfor
      if success == 0
        break;
      endif
    endfor
  endif
  if success == 1
    for i = 1:size(X,1)
      Y(i) = 0;
      for j = 1:size(P,1)
        numer = X(i)-P(:,1);
        numer(j) = 1;
        denom = P(j,1) - P(:,1);
        denom(j) = 1;
        Y(i) += prod(numer) * P(j,2) / prod(denom);
      endfor
    endfor
    Y = Y';
  endif
  if success == 0
    Y = [];
  endif  
endfunction
