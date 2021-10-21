function result = chem_engr (x)
if(x == 1)
  x+= 0.001;
endif
  K = 0.05; pt = 3;
  result = x./(1-x).*sqrt(2*pt./(2+x))-K;
endfunction
