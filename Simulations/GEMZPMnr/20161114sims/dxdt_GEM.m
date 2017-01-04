function dx = dxdt_GEM(t,x,bTF,e2)

global a b g Km

y = x(1);
GEM = x(2);

GEMe2p = (1 + Km * (GEM + e2) + sqrt((1 + Km*(GEM + e2))^2 - 4*Km^2*GEM*e2))/(2*Km);
GEMe2m = (1 + Km * (GEM + e2) + sqrt((1 + Km*(GEM + e2))^2 - 4*Km^2*GEM*e2))/(2*Km);

x(1) = a * b * GEMe2m - g * y;
x(2) = a * bTF - g * GEM;

dx = x;