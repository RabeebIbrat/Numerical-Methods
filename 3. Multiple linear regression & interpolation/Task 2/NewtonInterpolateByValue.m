function [Y success] = NewtonInterpolateByValue (P, X)
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
    [B, success] = SlopeGen(P);
  endif
  if success == 1
    for i = 1:size(X,1)
      temp = 1;
      Y(i) = B(1);
      for j = 1:size(P,1) - 1
        temp *= X(i)-P(j,1);
        Y(i) += B(j+1) * temp;
      endfor
    endfor
    Y = Y';
  endif
  if success == 0
    Y = [];
  endif  
endfunction
