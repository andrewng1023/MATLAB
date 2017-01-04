syms GEMa Ka u e2t theta Kd

[x1, x2] = solve(GEMa == (Ka * u * (e2t - GEMa))/((theta + Kd)*(theta + Ka*(e2t - GEMa)) - Ka * Kd * (e2t - GEMa)), GEMa);

print(x1)
print(x2)
