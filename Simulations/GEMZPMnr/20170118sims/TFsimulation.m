%Simulate the transfer function of Htormone to bound DNA

close all
clear

%Assumptions:

theta = 1;
KD = 1e-4;
Keq = 1e2;

Ht = logspace(0,3,9);
Ht = [0, Ht];
u = logspace(1,3,5);

TFa = zeros(length(u),length(Ht));
DNATFa = zeros(length(u),length(Ht));

for i = 1:length(u)
    for j = 1:length(Ht)
        TFa(i,j) = Ht(j) / (theta/u(i) * 1/KD + 1);
        DNATFa(i,j) = TFa(i,j) / (1/Keq + TFa(i,j));
    end
end

for i = 1:length(Ht)
    l{i} = num2str(Ht(i));
end

titles = {'pREV1','pRNR2','pRPL18B','pTEF1','pTDH3'};

x = 1:length(Ht);

figure()
hold on
for i = 1:length(u)
    plot(x,DNATFa(i,:),'DisplayName',titles{i},'LineWidth',3,'MarkerSize',10)
    %set(gca,'XScale','log')
    xticklabels(l)
    xtickangle(45)
    xlabel('E2 (nM)')
    ylabel('Fraction DNA Bound')
end

legend(titles)
