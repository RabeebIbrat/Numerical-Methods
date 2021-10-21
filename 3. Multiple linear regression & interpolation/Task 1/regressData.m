function [coeff success] = regressData (data, fig = 11, x_val = 0.025, y_val = 0.5, fontSize = 10)
  %graphics_toolkit('gnuplot');
  figure(fig);
  [coeff success] = MultiLinearRegress(data);
  if success == 0
    write = 'Cannot do multiple linear regression...';
  else
    write = [];
    if size(coeff) > 0  
      write = [write num2str(coeff(1))];
    endif
    for i = 2:size(coeff,1)
      if coeff(i) >= 0
        write = [write '+'];
      endif
      write = [write num2str(coeff(i)) 'x_' num2str(i-1)];
    endfor
  endif
  text(x_val, y_val, write, 'fontsize', fontSize);
endfunction
