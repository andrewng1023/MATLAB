 b function dx = dxdt_GEM_ZPM(t,x,bTF,e,p)

global a b g m n Km1 Km2 Km3 Km4

y = x(1);
TF2 = x(2);
TF1 = x(3);

TF2h = TF2 * (p/(Km4 + p))^n;

TF1h = TF1 * (e/(Km2 + e))^n;

x(1) = a * b * (TF2h/(Km3 + TF2h))^m  - g * y;
x(2) = a * b * (TF1h/(Km1 + TF1h))^m - g * TF2;
x(3) = a * bTF - g * TF1;

dx = x;