% Se resuelve el ej 5 del TP 2

% - - - - - - - - - - COSAS PARA CORRER EN OCTAVE - - - - - - - - - - 
pkg load control;
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

% DATOS
Ke = 20; K1 = Ke;
Kt = 20; K2 = Kt;
La = 100e-3; L = La;
Ra = 20; Rm = Ra;
J = 20;
B = 10;

a0 = (J*Rm)/K2;
b0 = (B*Rm)/K2 + K1;
c0 = a0/b0;

disp(cstrcat("a0: ", num2str(a0)));
disp(cstrcat("b0: ", num2str(b0)));

% Transferencia sin el polo (osea la aproximacion)
H0 = tf([1], [a0 b0]);

% mi solución ANALitica (mm rico)
ytanal = @(t) u(t).*(1/b0 - c0.*exp(-(1/c0).*t));

% Grafico ambas curvas en el mismo plot
figure();
hold on;
grid on;
set(gca, "linewidth", 2, "fontsize", 14);
step(H0);
[ytnum, x] = step(H0); hold on;
plot(x, ytanal(x), "r;Analitica;"); hold on;
h = findobj(gca, 'type', 'line');
set(h, 'LineWidth', 4)
legend();
