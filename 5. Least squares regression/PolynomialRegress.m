function [coeff, success] = PolynomialRegress (dataset, degree)
  %CUSTOM
  %dataset(x,y)
  %coeff -> a0+(a1)x+(a2)x^2+...+(a{degree})x^{degree}
  success = 1;
  if degree < 1
    printf("Error in PolynomialRegress: Invalid degree.");
    success = 0;
  elseif size(dataset,2) != 2
    printf("Error in PolynomialRegress: Invalid dataset.");
    success = 0;
  else
    ysum(degree+1) = 0;
    sum(2*degree+1) = 0;    
    for i = 1:size(dataset,1)
      temp = 1;      
      for j = 1:size(ysum,2);
        ysum(j) += (temp*dataset(i,2));
        sum(j) += temp;
        temp *= dataset(i,1);
      endfor
      for j = size(ysum,2)+1:size(sum,2)
        sum(j) += temp;
        temp *= dataset(i,1);
      endfor      
    endfor
    for i = 1:degree+1
      for j = 1:degree+1
        eqn(i,j) = sum(i+j-1);
      endfor
    endfor
    [coeff success] = GaussJordanElim(eqn,ysum);
  endif
  if success == 0
    coeff = [];
  endif
endfunction
