%------------------ Ejercicio 6 -----------------

pkg load control;

% DATOS
xi = 0.45594981;
wn = 3.529857617;
K = wn*wn;
Kh = 0.048911962;
a = xi*wn;
% scale = 

%Especificaciones de la respuesta transitoria
Mp = exp(-xi/(sqrt(1-xi^2))*pi);
tp = pi/(wn*sqrt(1-xi^2));
tr = (pi-acos(xi))/(wn*sqrt(1-xi^2));

%Defino G(s) y H(s)
G = tf([scale*K], [1 a K]);

%Respuesta al escalón de T(s)
figure();
step(G);
hold on;
