% Función que realiza las tareas de seguimiento de fase de acuerdo al
% modelo NO LINEAL del PLL.
%
%         [theta] = pll(dt, phi, Kd, Kv, kp, ki)
% dt:     resolución temporal [s]
% phi:    fase de entrada [Hz]
% Kd:     constante del detector de fase [V/rad]
% Kv:     constante del VCO [Hz/V]
% kp, ki: constantes del filtro de lazo F(s) = kp + ki/s;
function [theta] = pll(dt, phi, Kd, Kv, kp, ki)

% Valores iniciales de las variables del lazo.
theta = 0; 
psi = phi(1) - theta;
ed = Kd*sin(psi);
t = (0:length(phi)-1)*dt; % eje temporal

% Lazo de seguimiento de fase
for tt = 2:length(t)
    psi(tt) = phi(tt-1) - theta(tt-1);

    ed(tt) = Kd*sin(psi(tt));
    
	e0(tt) = kp*ed(tt) + ki*sum(ed)*dt;
    
    theta(tt) = Kv*sum(e0)*dt;
      
end

end