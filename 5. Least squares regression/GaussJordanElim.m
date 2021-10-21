function [C, success] = GaussJordanElim (A, x)
  %CUSTOM
  success = 1;
  if size(A,1) != size(A,2)
    printf("Error in Gauss row elim: Non-square matrix.\n");
    success = 0;
  elseif min(size(x,1),size(x,2)) > 1
    printf("Error in Gauss row elim: x is neither empty, nor a vector\n");
  else
    if size(x,1) * size(x,2) == 0
      %printf("Calculating inverse...\n");
      for i = 1:size(A,1)
        B(i,i) = 1;
      endfor
    else
      %printf("Solving homogeneous linear equations...\n");
      B = x;
      if size(B,1) == 1
        B = B';
      endif
    endif    
    %-----Gauss Jordan elimination-----
    len = size(A,1);
    for i = 1:len
      for j = i+1:len
        if abs(A(j,i)) > abs(A(i,i))
          temp = A(j,:);
          A(j,:) = A(i,:);
          A(i,:) = temp;
          temp = B(j,:);
          B(j,:) = B(i,:);
          B(i,:) = temp;
        endif
      endfor
      if A(i,i) == 0
        printf("Error in partial pivoting. No unique solution.\n")
        success = 0;
        break;
      endif
      temp = A(i,:)/A(i,i);
      temp2 = B(i,:)/A(i,i);
      for j = 1:len
        B(j,:) = B(j,:) - A(j,i)*temp2;
        A(j,:) = A(j,:) - A(j,i)*temp;
      endfor
      A(i,:) = temp;
      B(i,:) = temp2;
    endfor
    C = B;    
  endif
  
  if success == 0
    C = [];
  endif
endfunction
