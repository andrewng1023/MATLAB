%Simulate GEM driving YFP

clc
clear all
close all

%Constants
global a b g m n Km1 Km2

a = 1;
b = 1000;
g = 1;
m = 1;
n = 1;
Km1 = 200;
Km2 = 5;

y0 = 0;
TF0 = 0;

x0 = [y0;TF0];
t = linspace(0,10);
bTF = linspace(1,1000,5);
e = logspace(0,2,8);
e = [0,e];

options=odeset('AbsTol',1e-5); 

cstor = cell(length(e),length(bTF));
y_out = zeros(length(e),length(bTF));

for i = 1:length(e)
    for j = 1:length(bTF)
        [t_1,x_1] = ode45(@dxdt_GEM,t,x0,options,bTF(j),e(i));
        cstor{i,j} = x_1;
        y_out(i,j) = x_1(end,1);
    end
end

f = linspace(1,length(e),length(e));

for i = 1:length(e)
    l{i} = num2str(e(i));
end

titles = {'pREV1','pRNR2','pRPL18B','pTEF1','pTDH3'};

figure(1)
hold on
    
for i = 1:length(bTF)
    plot(f,y_out(:,i),'DisplayName',titles{i},'LineWidth',3,'MarkerSize',10)
    %set(gca,'XScale','log')
    xticklabels(l)
    xtickangle(45)
    xlabel('E2 (nM)')
    xlim([1,9])
    ylabel('out')
end

set(gca,'FontSize',20)
legend('Location','bestoutside')
print('GEM-FP','-dpng','-r300');