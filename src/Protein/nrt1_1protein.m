% Keep in mind that Pr=P(1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P0=100;
Tend=30;

tspan = [0, Tend];
rArray = [564.40 1292.23]; % NRT1.1
d=[1*10^(1.16) 1*10^(1.16)]; % NRT1.1
gname = 'NRT1.1';

% rArray = [719.70 848.92]; % CIPK23
% d=[1*10^(1.04) 1*10^(1.04)]; % CIPK23
% gname = 'CIPK23';

[s1,s2] = size(rArray);
legend_plot = cell(size(2,1));
n_levels = ['Low N ';...
            'High N'];

% For printing only one graph

figure()
hold on;

for j=1:2
    hold on;
    mn = rArray(1,j);
    dn = d(1,j);
    [T,P]=ode45(@(T,P) protein(T,P,mn,dn),tspan,P0);
    protein_levels{:,j} = P;
    h1 = plot(T,P);
    set(h1, 'linewidth',1.25);
    title(gname);
    
    legend_plot{j} = num2str(n_levels(j,:));
    fprintf('d = %s\tm = %s\n', num2str(dn), num2str(mn));
    fprintf('p0 = %s\tpf = %s\n', num2str(P0), num2str(P(length(P))));
end
xlabel('Time (hrs)');
ylabel('Protein (# of moecules)');

[hLegend, iconLegend, plotLegend, strLegend] =legend(legend_plot);
set(hLegend, 'FontSize', 30, 'Location', 'best');
set(iconLegend(:), 'linewidth', 1.25)
hold off;
