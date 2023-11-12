% Hago el bode de la respuesta en frecuencia
% con los datos experimentales de la planta.
% Los mismos se encuentran en el archivo 'motor.mat'

datos = load('motor.mat');
freq = datos.f;
fase = datos.fase;
mod = 20*log10(datos.mod);

figure('name', 'Respuesta en frecuencia del motor');
subplot(2, 1, 1, 'align');
plot(freq, mod);
subplot(2, 1, 2);
plot(freq, fase);
