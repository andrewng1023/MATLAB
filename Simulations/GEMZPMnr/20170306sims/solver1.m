%% Simulate the integrator

clc
clear all
close all

%Constants
global b Ka Kd eta Keq a

b = 1;
Ka = 1e-4;
Kd = 1;
eta = 1;
Keq = 1e2;
a = 1000;

Ht = logspace(0,3,9);
Ht = [0, Ht];
mu = logspace(1,3,5);

ZPM0 = 0;
ZPMa0 = 0;
CIIC0 = 0;

x0 = [ZPM0;ZPMa0;CIIC0];
t = linspace(0,10);

options=odeset('AbsTol',1e-5); 

cstor = cell(length(mu),length(Ht));
y_out = zeros(length(mu),length(Ht));

for i = 1:length(mu)
    for j = 1:length(Ht)
        [t_1,x_1] = ode23s(@dxdt_integrator,t,x0,options,mu(i),Ht(j));
        cstor{i,j} = x_1;
        y1_out(i,j) = x_1(end,1);
        y2_out(i,j) = x_1(end,3);
    end
end

f = linspace(1,length(Ht),length(Ht));

for i = 1:length(Ht)
    l{i} = num2str(Ht(i));
end

titles = {'pREV1','pRNR2','pRPL18B','pTEF1','pTDH3'};

%% Plot the simulations
figure(1)
hold on
    
for i = 1:length(mu)
    plot(f,y1_out(i,:),'DisplayName',titles{i},'LineWidth',3,'MarkerSize',10)
    plot(f,y2_out(i,:),':','DisplayName',titles{i},'LineWidth',3,'MarkerSize',10)
    %set(gca,'XScale','log')
    xticklabels(l)
    xtickangle(45)
    xlabel('[Pg]')
    xlim([1,9])
    ylabel('[ZPM]')
end

set(gca,'FontSize',20)
legend('Location','bestoutside')
%print('GEM-FP','-dpng','-r300');