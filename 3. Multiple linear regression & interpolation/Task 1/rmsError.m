function success = rmsError (data, dataname, poly, success = 1, fig = 12, x_val = 0.025, y_val = 0.5, fontSize = 10)
  %graphics_toolkit('gnuplot');
  if success == 1
    extra = ones(size(data,1),1);
    data = [extra data];
    clear extra;
    data(:, 1:size(data,2)-1) = data(:, 1:size(data,2)-1) .* poly';
    data(:, size(data,2)) = -data(:, size(data,2));
    errory = sum(data,2);
    error = real(sqrt( sum(errory.*errory) / size(errory,1)) );
    figure(fig);
    write = ['rms error for ' dataname ' = ' num2str(error)];
    text(x_val, y_val, write, 'fontsize', fontSize);
  endif
endfunction
