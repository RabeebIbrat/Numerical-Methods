function [quo, rem, success] = PolyDivide (divend, divor)
  %CUSTOM
  %quo = divend/divor
  %poly = p(1) + p(2)x^1 + ... + p(n+1)x^n
  success = 1;
  if size(divend,1) > 1
    divend = divend';
    if size(divend,1) > 1
      printf('Error in PolyDivide: Invalid dimension of divend\n');
      success = 0;
    endif
  endif
  if size(divor,1) > 1
    divor = divor';
    if size(divor) > 1
      printf('Error in PolyDivide: Invalid dimension of divor\n');
      success = 0;
    endif
  endif
  if success == 1
    while true  
      while size(divend,2) > 0 && divend(end) == 0
        divend(end) = [];
      endwhile
      while size(divor,2) > 0 && divor(end) == 0
        divor(end) = [];
      endwhile
      if size(divor,2) == 0
        success = 0;
        printf('Error in PolyDivide: Zero value of divor\n')
        break;
      endif
      quo = [];
      len = size(divor,2)-1;
      push = size(divend,2) - size(divor,2) + 1;
      while push > 0
        factor = divend(push+len) / divor(end);
        quo = [factor quo];
        divend(push:push+len) .-= (divor.*factor);
        divend(end) = [];
        push--;
      endwhile
      while size(divend,2) > 0 && divend(end) == 0
        divend(end) = [];
      endwhile
      if min(size(quo)) == 0
        quo = [0];
      endif
      if min(size(divend)) == 0
        divend = [0];
      endif
      rem = divend;
      break;
    endwhile
  endif
  if success == 0
    quo = [];
    rem = [];
  endif
endfunction
