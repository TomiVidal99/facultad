%------------------ Ejercicio 3 -----------------

%Defino los valores a y b, con a>b
a = 1;
b = 0.5;

%Polos de LC
roots([1 b+1 a])

%Estandarización
wn = sqrt(a);
xi = (b+1)/(2*sqrt(a));

%Especificaciones de la respuesta transitoria
Mp = exp(-xi/(sqrt(1-xi^2))*pi);
tp = pi/(wn*sqrt(1-xi^2));
tr = (pi-acos(xi))/(wn*sqrt(1-xi^2));

%Defino G(s) y H(s)
G = tf([1 a],conv([1 0],[1 b]));
H = 1;

%Calculo la funcion de transferencia de LC T(s)
T1 = feedback(G,H); 

%Respuesta al escalón de T(s)
figure
step(T1);
hold on

%Datos de la respuesta al escalón de T(s)
[y1,t1]= step(T1);

max(y1)
t1(y1==max(y1))
%%
%Calculo la funcion de transferencia de LC T2(s)
T2=tf([a],[1 b+1 a]);

%Respuesta al escalón de T2(s)
step(T2)

%Datos de la respuesta al escalón de T2(s)
[y2,t2]= step(T2);
hold off

max(y2)
t2(y2==max(y2))