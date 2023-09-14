% ----------- Ejercicio 7 -----------------

pkg load control;

% DATOS
xi = 0.559;
wn = 2.36;
a = wn^2;
b = xi*wn;
k = 0.25;

%Especificaciones de la respuesta transitoria
Mp = exp(-xi/(sqrt(1-xi^2))*pi)
tp = pi/(wn*sqrt(1-xi^2))
tr = (pi-acos(xi))/(wn*sqrt(1-xi^2))

%Defino G(s) y H(s)
G = tf([k*a], [1 b a]);

%Respuesta al escalón de T(s)
figure();
step(G);
hold on;
