% Resuelvo el Ej 3, de Control Automatico 1
% Corroboro que la respuesta al escalón obtenida analiticamente
% sea la misma que la numérica
clc; close all;
pkg load symbolic;

syms s;

Xs = 1/s;

for (a = -5:0.1:5)
  b = -3;

  figure();
  hold on;
  grid on;
  set(gca, "linewidth", 2, "fontsize", 14);

  Gs = (s+a)/((s)*(s+b));
  Ys = Gs*Xs;
  l = ezplot(Ys);
  h = findobj(gca, 'type', 'line');
  set(h, 'LineWidth', 4)
  title(cstrcat("a=", num2str(a)));
  print(cstrcat("./plots/", "fig-a=", num2str(a), ".png"))

end

legend();
