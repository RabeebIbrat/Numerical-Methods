function [coeff success] = MultiLinearRegress (dataset)
  %CUSTOM
  %dataset(x1,x2,...,xn,y{row})
  %coeff -> a0+(a1)x1+(a2)x2+...+(a{var})x{var}
  success = 1;
  if size(dataset,2) < 2
    printf("Error in MultiLinearRegress: Invalid dataset.");
    success = 0;
  else
    var = size(dataset,2) - 1;
    eqn(var+1,var+1) = 0;
    ysum(var+1) = 0;
    for i = 1:size(dataset,1)
      temp = [1 dataset(i,:)];
      temp(end) = [];
      for j = 1:var+1
        eqn(j,:) += temp.*temp(j);
      endfor
      ysum += dataset(i,var+1).*temp;
    endfor
    [coeff success] = GaussJordanElim(eqn,ysum);
  endif
  if success == 0
    coeff = [];
  endif
endfunction
