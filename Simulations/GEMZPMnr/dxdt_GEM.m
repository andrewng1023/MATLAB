function dx = dxdt_GEM(t,x,bTF,e)

global a b g m n Km1 Km2

y = x(1);
TF = x(2);

TFh = TF * (e/(Km2 + e))^n;

x(1) = a * b * (TFh/(Km1 + TFh))^m - g * y;
x(2) = a * bTF - g * TF;

dx = x;
