function [poly success] = NewtonInterpolate (P)
  %CUSTOM
  %P(i) = (x_i,y_i)
  success = 1;
  if size(P,2) != 2 || size(P,1) < 2
    printf('Error in NewtonInterpolate: Invalid dimension of P\n');
    success = 0;
  endif
  if success == 1  
    [B, success] = SlopeGen(P);
  endif
  if success == 1
    poly = zeros(1,size(P,1));
    temp = [1];
    poly(1) += B(1)*temp;
    for i = 1:size(P,1) - 1
      temp = PolyMultiply(temp, [-P(i,1) 1]);
      poly(1:size(temp,2)) += B(i+1) .* temp;
    endfor
    if success == 0
      poly = []
    endif
  endif
endfunction
