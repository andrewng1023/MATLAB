%Simulate GEM driving YFP

clc
clear all
close all

%Constants
global a b g m n Km1 Km2 Km3 Km4

a = 1;
b = 1000;
g = 1;
m = 1;
n = 1;
Km1 = 100;
Km2 = 5;
Km3 = 100;
Km4 = 2;

y0 = 0;
TF1_0 = 0;
TF2_0 = 0;

x0 = [y0;TF2_0;TF1_0];
t = linspace(0,10);
bTF = linspace(1,1000,5);
e = logspace(0,2,12);
p = logspace(0,2,12);

options=odeset('AbsTol',1e-5); 

cstor = cell(length(e),length(p),length(bTF));
y_out = zeros(length(e),length(p),length(bTF));

for i = 1:length(e)
    for k = 1: length(p)
        for j = 1:length(bTF)
            [t_1,x_1] = ode45(@dxdt_GEM_ZPM,t,x0,options,bTF(j),e(i),p(k));
            cstor{i,k,j} = x_1;
            y_out(i,k,j) = x_1(end,1);
        end
    end
end


titles = {'pREV1','pRNR2','pRPL18B','pTEF1','pTDH3'};

for i = 1:length(bTF)
    figure(i)
    imagesc(y_out(:,:,i),[0,800])
    colorbar
    title(titles{i})
    xlabel('E2 (nM)')
    ylabel('Pg (nM)')
    print(strcat(titles{i},'cmap'),'-dpng','-r300');
end

