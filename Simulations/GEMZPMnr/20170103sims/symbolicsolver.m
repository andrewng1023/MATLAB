syms GEMa Ka u e2t theta Kd

x = solve(GEMa == (Ka * u * (e2t - GEMa))/((theta + Kd)*(theta + Ka*(e2t - GEMa)) - Ka * Kd * (e2t - GEMa)), GEMa);

vars = [1e12, 1, 1e3];

x1s = subs(x(1), {Ka, theta, Kd}, vars);
x2s = subs(x(2), {Ka, theta, Kd}, vars);

e2r = logspace(0,4,20);
e2r = [0,e2r];
ur = linspace(0,100,5);

for i = 1:length(ur)
    for j = 1:length(e2r)
        sol1(i,j) = subs(x1s, {u, e2t}, [ur(i), e2r(j)]);
        sol2(i,j) = subs(x2s, {u, e2t}, [ur(i), e2r(j)]);
    end
end

for i = 1:length(e2r)
    l{i} = num2str(e2r(i));
end

titles = {'pREV1','pRNR2','pRPL18B','pTEF1','pTDH3'};

hold on
for i = 1:length(ur)
    plot(e2r,sol2(i,:),'DisplayName',titles{i},'LineWidth',3,'MarkerSize',10)
    %set(gca,'XScale','log')
    xticklabels(l)
    xtickangle(45)
    xlabel('E2 (nM)')
    xlim([1,9])
    ylabel('out')
end