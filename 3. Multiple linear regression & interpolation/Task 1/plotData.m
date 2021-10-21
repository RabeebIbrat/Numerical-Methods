function data = plotData (data, fig = 10, figName = 'default', sizeFactor = 0.02)
  %graphics_toolkit('qt');
  figure(fig);
  scatter(data(:,1), data(:,2), data(:,5).*sizeFactor, data(:,7),'filled');
  bar = colorbar('eastoutside');
  colormap('jet');
  title(['Scatter diagram for ' figName]);
  xlabel('longitude');
  ylabel('latitude');
  title(bar,'median household value');
endfunction
