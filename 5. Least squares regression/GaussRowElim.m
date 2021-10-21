function [B, success] = GaussRowElim (A,x)
  %CUSTOM
  success = 1;
  if size(A,1) != size(A,2)
    printf("Error in Gauss row elim: Non-square matrix.\n");
    success = 0;
  elseif size(A,1) != size(x,1)
    printf("Error in Gauss row elim: Invalid comparitive size of matrix and vector.\n")
  else
    %-----Row elimination-----
    len = size(A,1);
    for i = 1:len
      for j = i+1:len
        if abs(A(j,i)) > abs(A(i,i))
          temp = A(j,:);
          A(j,:) = A(i,:);
          A(i,:) = temp;
          temp = x(j);
          x(j) = x(i);
          x(i) = temp;
        endif
      endfor
      if A(i,i) == 0
        printf("Error in partial pivoting. No unique solution.\n")
        success = 0;
        break;
      endif
      for j = i+1: len
        scalar = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - scalar*A(i,:);
        x(j) = x(j) - scalar*x(i);
      endfor
    endfor
    %-----Back substitution-----
    if success == 1
      for i = len:-1:1
        B(i) = ( x(i) - sum(A(i,i+1:len)) ) / A(i,i);
        A(1:i-1,i) = A(1:i-1,i) * B(i);
      endfor
    endif
  endif
  
  if success == 0
    B = [];
  endif
endfunction
