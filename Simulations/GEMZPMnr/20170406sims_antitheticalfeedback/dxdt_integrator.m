function dx = dxdt_integrator(t,x,mu,E2T,PgT)

global Kde Kae Kdp Kap b eta aG_1 aG_2 aZ_1 aZ_2 theta1 theta2 KeqG KeqZ 

GEM = x(1);
GEMa = x(2);
ZPM = x(3);
ZPMa = x(4);
Anchor = x(5);
GEM_Anchor = x(6);
pZ3_out = x(7);

x(1) = mu + Kde*GEMa + b*GEM_Anchor - Kae*GEM*(E2T - GEMa) - eta*GEM*Anchor - theta1*GEM;
x(2) = Kae*GEM*(E2T - GEMa) - Kde*GEMa;
x(3) = aG_1 + aG_2*GEMa/(1/KeqG + GEMa) + Kdp*ZPMa - Kap*ZPM*(PgT - ZPMa) - theta2*ZPM;
x(4) = Kap*ZPM*(PgT - ZPM) - Kdp*ZPMa;
x(5) = aZ_1 + aZ_2*ZPMa/(1/KeqZ + ZPMa) + b*GEM_Anchor - eta*GEM*Anchor - theta1*Anchor;
x(6) = eta*GEM*Anchor - b*GEM_Anchor;
x(7) = aZ_1 + aZ_2*ZPMa/(1/KeqZ + ZPMa) - theta2*pZ3_out;

dx = x;