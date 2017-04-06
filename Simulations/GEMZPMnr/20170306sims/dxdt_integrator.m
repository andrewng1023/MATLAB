function dx = dxdt_ZPM(t,x,mu,Ht)

global b Ka Kd eta Keq a

ZPM = x(1);
ZPMa = x(2);
CIIC = x(3);

x(1) = mu - b*ZPM - Ka*ZPM*(Ht - ZPMa) - eta*ZPM*CIIC + Kd*ZPMa;
x(2) = Ka*ZPM*(Ht - ZPMa) - Kd*ZPMa;
x(3) = a*(ZPMa/(1/Keq + ZPMa)) - b*CIIC - eta*CIIC*ZPM;

dx = x;