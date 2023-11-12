%% Ejemplo de ensayo de escal�n, Ziegler Nichols

clear, clc, close all

% Planta
G=zpk([],[-10 -10 -10],10);

% Ensayo
opt = stepDataOptions('InputOffset',0,'StepAmplitude',1);
[y,t]=step(G,opt);

% Gr�fico de la respuesta
subplot(211)
    plot(t,y); hold on; grid on;   
% Gr�fico de la derivada discreta, para localizar el punto de inflexi�n
subplot(212)
    plot(t(1:end-1),diff(y)./diff(t)); hold on; grid on;

t0 = 0.2; % coordenada t del pto. de inflexi�n (m�ximo de la derivada)
m = 0.02705; % valor de la derivada en t0, pendiente de recta tangente
y0 = 0.003233; % valor de la salida en t0
tangente=(t-t0)*m+y0;

subplot(211)
    plot(t(1:(end+1)/2),tangente(1:(end+1)/2),'k')
    ylim([-1e-3 11e-3])
subplot(212)
    plot([t0 t0],[0 m],'k--')

%% Medimos L, T y K en el gr�fico (R=tg(a)=K/T)
L=0.08;
T=0.45;
K=10e-3/1;

subplot(211)
    plot([L L],[0 K],'k--')
    plot([T T],[0 K],'k--')
    plot([0 t(end)],[K K],'k--')

%% Mismo ensayo, escal�n de amplitud doble
opt = stepDataOptions('InputOffset',0,'StepAmplitude',2);
[y,t]=step(G,opt);

subplot(211)
    plot(t,y);

subplot(212)    
    plot(t(1:end-1),diff(y)./diff(t));

t0 = 0.2; 
m = 2*0.02705; 
y0 = 2*0.003233; 
tangente=(t-t0)*m+y0;    

subplot(211)
    plot(t(1:(end+1)/2),(t(1:(end+1)/2)-t0)*m+y0,'k')
    
K=20e-3/2;    
    plot([L L],[0 2*K],'k--')
    plot([T T],[0 2*K],'k--')
    plot([0 t(end)],[2*K 2*K],'k--')
    
ylim([-1e-3 21e-3])

subplot(212)
    plot([t0 t0],[0 m],'k--')

%% Respuesta al escal�n con PID ajustado por ZN
% Los valores de par�metros de ambos ensayos son los mismos, ya que L y T
% no var�an, y aunque la amplitud de la respuesta var�a, la ganancia no
% cambia.

kp=1.2*T/(L*K);
Ti=2*L;
Td=0.5*L;
Tf=1e-3;

C=pid(kp,kp/Ti,kp*Td,Tf);
figure, step(feedback(1,G*C)); hold on; 

kp=1.2*T/(L*2*K);
C=pid(kp,kp/Ti,kp*Td,Tf);
step(feedback(1,G*C)); hold on; 
