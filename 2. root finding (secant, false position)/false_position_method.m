function [result iteration] = false_position_method (func, low, high, err, max_iter)
  while func(low)*func(high) > 0 
    fprintf("Invalid guesses.\n")
    low = input("Enter lower bound: ");
    high = input("Enter upper bound: ");
  endwhile
  if(low > high)
    temp = low;
    low = high;
    high = temp;
  endif
  fhigh = func(high); flow = func(low); new = low;
  for i = 1:max_iter
    new = high - fhigh*(low-high)/(flow-fhigh);
    fnew = func(new);
    base = low;
    if(base == 0)
      base += err*0.01;
    endif
    errnow = abs((new - low)/low);
    if errnow <= err
      break
    endif
    if fnew < 0
      low = new; flow = fnew;
    elseif fnew > 0
      high = new; fhigh = fnew;
    else
      break
    endif
   endfor
   result = new;
   iteration = i;
endfunction
