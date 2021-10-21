function success = Task1(sizeFactor = 0.035, xLine = 0.025, yLine = 0.8, yLineSpace = 0.3, fontSize = 10)
  warning off;
  train = csvread('train.csv',1,0);
  test = csvread('test.csv',1,0);
  missing = [];
  for i = 1:size(train,1)
    if train(i,4) == 0
      missing = [missing; i];
    endif
  endfor
  avg = sum(train(:,4)) / (size(train,1) - size(missing,1));
  for i = missing
    train(i,4) = avg;
  endfor
  plotData(train, 1, 'train', sizeFactor);
  plotData(test, 2, 'test', sizeFactor);
  figure(3);
  clf;
  [poly success] = regressData(train, 3, xLine, yLine, fontSize);
  success2 = rmsError(train, 'train', poly, success, 3, xLine, yLine-yLineSpace, fontSize);
  success3 = rmsError(test, 'test', poly, success, 3, xLine, yLine-(2*yLineSpace), fontSize);
  success = success + success2 + success3;
  success -= 2;
  if success < 0
    success = 0;
  endif
  warning on;
endfunction