%% Simulate the integrator

clc
clear all
close all

%Constants
global Kde Kae Kdp Kap b eta aG_1 aG_2 aZ_1 aZ_2 theta1 theta2 KeqG KeqZ 

Kde = 1;
Kae = 1;
Kdp = 1;
Kap = 1;
b = 1;
eta = 1;
aG_1 = 1;
aG_2 = 10;
aZ_1 = 1;
aZ_2 = 10;
theta1 = 1;
theta2 = 5;
KeqG = 100;
KeqZ = 100;

E2_1 = 10;
E2_2 = 1000;
Pg = 100;
mu = 1;

GEM0 = 0;
GEMa0 = 0;
ZPM0 = 0;
ZPMa0 = 0;
Anchor0 = 0;
GEM_Anchor0 = 0;
pZ3_out0 = 0;

x0 = [GEM0;GEMa0;ZPM0;ZPMa0;Anchor0;GEM_Anchor0;pZ3_out0];

t = linspace(0,10);

options=odeset('AbsTol',1e-5); 

[t_1,x_1] = ode23s(@dxdt_integrator,t,x0,options,mu,E2_1,Pg);
[t_2,x_2] = ode23s(@dxdt_integrator,t,x_1(end,:),options,mu,E2_2,Pg);

%% Plot the simulations
figure(1)
hold on
   
titles = {'GEM','GEMa','ZPM','ZPMa','Anchor','GEM_Anchor','pZ3_Out'};

CM = jet(length(x0));
for i = 1:length(x0)
    plot(t_1,x_1(:,i),'DisplayName',titles{i},'color',CM(i,:),'LineWidth',3,'MarkerSize',10)
    plot(t_2+10,x_2(:,i),':','DisplayName',titles{i},'color',CM(i,:),'LineWidth',3,'MarkerSize',10)
    %set(gca,'XScale','log')
    xlabel('t')
    ylabel('out')
end

set(gca,'FontSize',20)
legend('Location','bestoutside')
%print('GEM-FP','-dpng','-r300');