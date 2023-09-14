% Resuelvo el Ej 1, de Control Automatico 1
% Corroboro que la respuesta al escalón obtenida analiticamente
% sea la misma que la numérica
clc; close all;
pkg load symbolic;

xi = 0.559;
wn = 2.36;
a = wn^2;
b = xi*wn;

syms s;

figure();
hold on;
grid on;
set(gca, "linewidth", 2, "fontsize", 14);

Xs = 1/s;
Gas = a / (s*s+s*b+a);
yat = ilaplace(Xs*Gas);
% yatA = @(t) u(t).*( 1 + 3.*exp(-2.*t) -4.*exp(-3.*t) );

ezplot(yat, [0, 20]);
% T = [0:1e-3:20];
% plot(T, yatA(T), "linewidth", 2, "r;Analítica;");

legend();
