clear, clc, close all
load motor.mat;

w=2*pi*f;

figure
subplot(211), semilogx(w,20*log10(mod),'--x'), grid on, hold on
subplot(212), semilogx(w,fase,'--x'), grid on, hold on

% para agregar el efecto de un integrador
s=tf('s');
integrador=1/s;
valsIntegrador = freqresp(integrador, 1i*w);
modIntegrador=squeeze(abs(valsIntegrador));
faseIntegrador = squeeze(angle(valsIntegrador))*180/pi;

subplot(211), semilogx(w,20*log10(mod)+20*log10(modIntegrador'),'--x'), grid on, hold on
subplot(212), semilogx(w,fase+faseIntegrador','--x'), grid on, hold on

% Para graficar una función de transferencia en el mismo
% sys=tf(...)
% [mag,phase,wout] = bode(sys,logspace(-1,2,100));
% subplot(211), semilogx(wout,squeeze(20*log10(mag)))
% subplot(212), semilogx(wout,squeeze(phase))

