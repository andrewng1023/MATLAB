function dx = dxdt_GEM_ZPM(t,x,bTF,e,p)

global a b g m n Km1 Km2 Km3 Km4

y = x(1);
TF2 = x(2);
TF1 = x(3);

x(1) = a * b * (TF2/(Km3 + TF2))^m * (p/(Km4 + p))^n - g * y;
x(2) = a * b * (TF1/(Km1 + TF1))^m * (e/(Km2 + e))^n - g * TF2;
x(3) = a * bTF - g * TF1;

dx = x;