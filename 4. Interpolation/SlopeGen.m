function [slope, success] = SlopeGen (P)
  %CUSTOM
  %P(i,:) = (x_i,y_i)
  success = 1;
  if size(P,2) != 2
    printf('Error in SlopeGen: Invalid dimension for P\n');
    success = 0;
  endif
  if success == 1
    dim = size(P,1);
    dp = zeros(dim,dim);
    for i = 1:dim
      dp(i,i) = P(i,2);
    endfor
    for len = 1:dim-1
      for j = 1 : dim-len
        if P(j,1) == P(j+len,1)
          printf('Error in SlopeGen: Identical values of X_i,X_j\n');
          success = 0;
          break;
        endif
        dp(j,j+len) = (dp(j+1,j+len) - dp(j,j+len-1)) / (P(j+len,1)-P(j,1));
      endfor
      if success == 0
        break;
      endif  
    endfor
    slope = dp(1,:);
  endif
  if success == 0
    slope = [];
  endif
endfunction
