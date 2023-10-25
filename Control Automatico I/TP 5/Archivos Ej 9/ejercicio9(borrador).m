%% Ejercicio 9
clear, clc, close all

s=tf([1 0],1);
G=-100/((s+10)*(s+50));

%% a
C1=-1/s;
% figure, rlocus(G*C1)

%% b
C2=C1*250;

[y1,t1]=step(1/s*feedback(G*C1,1),1000);
[y2,t2]=step(1/s*feedback(G*C2,1),t1);
rampa=1*t1;
figure, plot(t1,rampa-y1,t1,rampa-y2)

%% c
close all
figure, bode(G*C2,{1e-3,1e4}); grid on; hold on;
% figure, margin(G*C2); grid on; hold on;

%%
C3=C2*(1+s/5e-2);
% bode(G*C2,G*C3,{1e-3,1e4}); grid on;
bode(G*C3,{1e-3,1e4}); grid on;
[Gm,Pm,Wgm,Wpm] = margin(G*C3);
fprintf('MF=%.2f, w0dB=%.2f \n',Pm,Wpm)

%% Enfoque 1
phim=40-4.86+5;
w0=706.17;
% phim=45;
% w0=700;

b=w0*sqrt((1+sind(phim))/(1-sind(phim)));
a=w0^2/b;

C4=C3*(1+s/a)/(1+s/b);
[Gm,Pm,Wgm,Wpm] = margin(G*C4); 
fprintf('MF=%.2f, w0dB=%.2f \n',Pm,Wpm)
figure, bode(G*C3,G*C4,{1e-3,1e4}); grid on; hold on;
%%
phim=45; 
w0=1226;
% w0=1109;
b=w0*sqrt((1+sind(phim))/(1-sind(phim)));
a=w0^2/b;
C4=C3*(1+s/a)/(1+s/b);
[Gm,Pm,Wgm,Wpm] = margin(G*C4); 
fprintf('MF=%.2f, w0dB=%.2f \n',Pm,Wpm)
bode(G*C4,{1e-3,1e4}); grid on

%% Enfoque 2
close all
phim=40-4.86+5;
w0=706.17;

b=w0*sqrt((1+sind(phim))/(1-sind(phim)))
a=w0^2/b;

K4=sqrt(a/b);

C5=C3*K4*(1+s/a)/(1+s/b);
[Gm,Pm,Wgm,Wpm] = margin(G*C5); 
fprintf('MF=%.2f, w0dB=%.2f \n',Pm,Wpm)
bode(G*C3,G*C5,G*C4,{1e-3,1e4}); grid on

%% Enfoque 3
close all
w0=706.17;
phi=40-4.86;

a=w0;
b=w0/tand(45-phi);
C6=C3*(1+s/a)/(1+s/b);

[Gm,Pm,Wgm,Wpm] = margin(G*C6); 
fprintf('MF=%.2f, w0dB=%.2f \n',Pm,Wpm)
bode(G*C3,G*C6,G*C5,{1e-3,1e4}); grid on