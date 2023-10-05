pkg load control;

s = tf('s');

% G = (3*s-1)/(1.5*s+1);
% H = 1;
G = (s*s+2*s+1)/(s*(s+4)*(s+1));
H = 1;

rlocus(G*H);
