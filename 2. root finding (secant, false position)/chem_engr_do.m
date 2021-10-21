fprintf("Employing false position method to the problem:\n");
[result iterations] = false_position_method(@chem_engr,-1.8,0.8,0.5/100,100)
fprintf("\n");
fprintf("Employing secant method to the problem:\n");
[result iterations] = secant_method(@chem_engr,-1.8,0.8,0.5/100,100)
fprintf("\n");
clear result iterations;