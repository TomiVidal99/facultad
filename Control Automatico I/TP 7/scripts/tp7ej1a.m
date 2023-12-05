% Corroboro que la transformada Z esté bien

pkg load control;
pkg load symbolic;

syms t s z n;

Ts = 1/10;

Es = 1/(s*(s+1)*(s+1))
Et = ilaplace(Es)
Ez = ztrans(Et)

Ez2 = ztrans(1-exp(-n*Ts)-(n*Ts)*exp(-n*Ts))
