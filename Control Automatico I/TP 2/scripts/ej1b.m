% Resuelvo el Ej 1 b, de Control Automatico 1
% Corroboro que la respuesta al escalón obtenida analiticamente
% sea la misma que la numérica
clc; close all;
pkg load symbolic;
% PLOTS_DIR = "C:/Users/tomi/Documents/plots/";

syms s;

figure();
hold on;
grid on;
set(gca, "linewidth", 2, "fontsize", 14);

Xs = 1/s;
Gas = 4/((s+2)^2);
yat = ilaplace(Xs*Ga
yatA = @(t) u(t).*( 1 - t.*exp(-2.*t) );

ezplot(yat, [0, 20]);
T = [0:1e-3:20];
plot(T, yatA(T), "linewidth", 2, "r;Analítica;");

legend();
