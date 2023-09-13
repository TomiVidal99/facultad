% Corroboro que la respuesta al escalón obtenida analiticamente
% sea la misma que la numérica

% Resuelvo el Ej 2, de Control Automatico 1
clc; close all;
pkg load symbolic;
% PLOTS_DIR = "C:/Users/tomi/Documents/plots/";

syms s;

figure();
hold on;
grid on;
set(gca, "linewidth", 2, "fontsize", 14);

wn = 10;
chi = 1;
Hs = (wn^2)/((s^2)+(2*wn*s)+(wn^2))
Xs = 1/s;
yt = ilaplace(Hs*Xs)
myResponse = @(t) u(t).*(1 - t.*(exp(-wn.*t)));

ezplot(yt, [0,2]);
figure();
hold on;
grid on;
set(gca, "linewidth", 2, "fontsize", 14);
ezplot(myResponse, [0,2]);
% T = [0:1e-6:2];
% plot(T, myResponse(T), "linewidth", 2, "r;Analítica;");
% print(cstrcat(PLOTS_DIR, "fig-(", num2str(i), ").png"))

legend();
