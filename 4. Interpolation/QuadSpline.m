function [poly, success] = QuadSpline (P)
  %CUSTOM
  %P(i) = (x_i,y_i)
  success = 1;
  if size(P,2) != 2 || size(P,1) < 2
    printf('Error in QuadSpline: Invalid dimension of P\n');
    success = 0;
  endif
  if success == 1
    n = size(P,1) - 1;
    eqn = zeros(3*n,3*n);
    Y = zeros(3*n,1);
    for i = 1:n-1
      eqn(i, 3*i-2 : 3*i) = [1 P(i,1) P(i,1)^2];
      Y(i) = P(i,2);
      eqn(n+i, 3*i-2 : 3*i) = [1 P(i+1,1) P(i+1,1)^2]
      Y(n+i) = P(i+1,2);
      eqn(2*n+i, 3*i-2 : 3*i+3) = [0 1 2*P(i) 0 -1 -2*P(i+1)];
    endfor
    i = n;
      eqn(i, 3*i-2 : 3*i) = [1 P(i,1) P(i,1)^2];
      Y(i) = P(i,2);
      eqn(n+i, 3*i-2 : 3*i) = [1 P(i+1,1) P(i+1,1)^2]
      Y(n+i) = P(i+1,2);
      eqn(2*n+i, 3) = 1;  %boundary condition
    [X success] = GaussJordanElim(eqn, Y);
    if success == 1
      for i = 1:n
        poly(i,:) = Y(3*i-2 : 3*i)'
      endfor
    endif
  endif
  if success == 0
    poly = [];
  endif
endfunction
