%graphics_toolkit('gnuplot');

%Given data
fullData = csvread('shampoo.csv',1,0);
given = fullData;
note = [];
for i = 1:size(given,1)
  if given(i,2) == 0
    note = [note i];
  endif
endfor
missing = given([note],1);
given([note],:) = [];
figure(1);
clf;
hold on;
title('Given data');
xlabel('Month');
ylabel('Shampoo sale');
plot(given(:,1),given(:,2),'o-', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerSize', 3);

%Binary search for missing
locate = [];
for i = 1:size(missing,1)
  if missing(i) < given(1,1) || missing(i) > given(end,1)
    continue;
  endif
  start = 1; finish = size(given,1);
  while finish-start > 1
    mid = floor((start + finish) / 2);
    if given(mid,1) < missing(i)
      start = mid;
    elseif given(mid,1) > missing(i)
      finish = mid;
    else
      start = mid; finish = start+1;
      break;
    endif
  endwhile
  locate = [locate; start];
endfor

%Linear spline
[P success] = LineSpline(given);
if success == 1  
  figure(2);
  clf;
  hold on;
  title('Linear spline');
  xlabel('Month');
  ylabel('Shampoo sale');
  plot(P(:,1), P(:,2));
  clear Y
  for i = 1:size(missing,1)  
    Y(i,1) = given(locate(i),2) + (missing(i)-given(locate(i),1)) / (given(locate(i)+1,1)-given(locate(i),1)) * (given(locate(i)+1,2)-given(locate(i),2));
  endfor
  plot(missing, Y,'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerSize', 3);
  LinearSpline = [missing Y]
endif

%Quadratic Spline
[poly success] = QuadSpline(given);
if success == 1
  figure(3);
  clf;
  hold on;
  title('Quadratic Spline');
  xlabel('Month');
  ylabel('Shampoo sale');
  for i = 1:size(given,1)-1
    PlotPoly(poly(i,:), given(i,1), given(i+1,1), 10, 3);
  endfor
  clear Y;
  for i = 1:size(missing)
    Y(i,1) = PlotPoly(poly(locate(i),:), missing(i), missing(i), 1, 3, 2);
  endfor
  QuadraticSpline = [missing Y]
endif

%Newton Interpolation
[poly success] = NewtonInterpolate(given);
if success == 1
  figure(4);
  clf;
  hold on;
  title('Newton Interpolation');
  xlabel('Month');
  ylabel('Shampoo sale');
  PlotPoly(poly, given(1,1), given(end,1), 300, 4);
  clear Y;
  for i = 1:size(missing)
    Y(i,1) = PlotPoly(poly, missing(i), missing(i), 1, 4, 2);
  endfor
  NewtonInterpolation = [missing Y]
endif

%Newton Interpolation by Value
div = 300;
X = linspace(given(1,1), given(end,1), 300);
[Y success] = NewtonInterpolateByValue(given, X);
[found success2] = NewtonInterpolateByValue(given, missing);
if success + success2 == 2
  figure(5);
  clf;
  hold on;
  title('Newton Interpolation by Value');
  xlabel('Month');
  ylabel('Shampoo sale');
  plot(X, Y, 'b');
  for i = 1:size(missing)
    plot(missing(i), found, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
  endfor
  NewtonInterpolationByValue = [missing found]
endif

%Lagrange Interpolation
[poly success] = LagrangeInterpolate(given);
if success == 1
  figure(6);
  clf;
  hold on;
  title('Lagrange Interpolation');
  xlabel('Month');
  ylabel('Shampoo sale');
  PlotPoly(poly, given(1,1), given(end,1), 300, 6);
  clear Y;
  for i = 1:size(missing)
    Y(i,1) = PlotPoly(poly, missing(i), missing(i), 1, 6, 2);
  endfor
  LagrangeInterpolation = [missing Y]
endif

%Lagrange Interpolation 2
[poly success] = LagrangeInterpolate2(given);
if success == 1
  figure(7);
  clf;
  hold on;
  title('Lagrange Interpolation 2');
  xlabel('Month');
  ylabel('Shampoo sale');
  PlotPoly(poly, given(1,1), given(end,1), 300, 7);
  clear Y;
  for i = 1:size(missing)
    Y(i,1) = PlotPoly(poly, missing(i), missing(i), 1, 7, 2);
  endfor
  LagrangeInterpolation2 = [missing Y]
endif

%Lagrange Interpolation by Value
div = 300;
X = linspace(given(1,1), given(end,1), 300);
[Y success] = LagrangeInterpolateByValue(given, X);
[found success2] = LagrangeInterpolateByValue(given, missing);
if success + success2 == 2
  figure(8);
  clf;
  hold on;
  title('Lagrange Interpolation by Value');
  xlabel('Month');
  ylabel('Shampoo sale');
  plot(X, Y, 'b');
  for i = 1:size(missing)
    plot(missing(i), found, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
  endfor
  LagrangeInterpolationByValue = [missing found]
endif
clear
