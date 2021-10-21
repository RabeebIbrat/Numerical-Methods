x = (-2*pi:0.2:2*pi)';
plot (x,cos(x),"g");
hold;
colors = ['y'; 'c'; 'b'; 'r'];
iter = [1 3 5 20];
for i = 1:4
  plot (x,Cos(x,iter(i)),[colors(i) "--"]);
endfor
title("Approximation of cos using Taylor series");
xlabel("Values of x");
ylabel("Values of cos x");
clear x colors i iter;