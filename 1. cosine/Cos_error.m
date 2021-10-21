for i = 1:50
  y(i) = abs(cos(1.5)-Cos(1.5,i));
 endfor
plot(y);
title("Error in approximation of cos")
xlabel("Number of iterations");
ylabel("Amount of error");
clear i y;