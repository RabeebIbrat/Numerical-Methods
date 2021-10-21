function success = PlotPoly (poly, left, right, div = 20, fig = 10)
  %CUSTOM
  success = 1;
  if size(poly,2) == 1
    poly = poly'
  endif
  if size(poly,1) > 1
    printf('Error in PlotPoly: Invalid dimension of poly');
    success = 0;
  endif
  if success == 1
    X = linspace(left, right, div)';
    temp = ones(div,1);
    for i = 1:size(poly,2)
      Y(:,i) = temp.*poly(i);
      temp .*= X;
    endfor
    Y = sum(Y,2);
    figure(fig)
    plot(X,Y);
  endif
endfunction
