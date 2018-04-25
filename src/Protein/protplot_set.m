% Keep in mind that Pr=P(1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P0=0.1;
Tend=100;
% dArray = [0.1, 0.5, 1, 2, 2.5, 3];
% dArray = logspace(1,7,20);
% rArray = linspace(1e-6,1,5);
dArray = linspace(0.5,2.5,11)
% rArray = [1e-6, 0.5, 1];
rArray = (scaled_KCl_av(1,[1 4 7]))*0.75;
m=numel(rArray);
n=numel(dArray);
tspan = [0, Tend];

legend_plot = cell(size(n));

colorVec=hsv(n);
figure()
hold on;

for i=1:m
%     dn=dArray(i);
    mn = rArray(i);
    subplot(1,3,i)
    for j=1:n
        hold on;
        dn=dArray(j);
%         mn = rArray(j);
        [T,P]=ode45(@(T,P) protein(T,P,mn,dn),tspan,P0);
        plot(T,P, 'Color', colorVec(j,:))
        title(horzcat('p = ', num2str(P0), ', m = ', num2str(mn)))
        % axis([0.001,100,0,1.5]);
        legend_plot{j} = ['d = ', num2str(dn)];
        fprintf('d = %s\tm = %s\n', num2str(dn), num2str(mn));
    end
    xlabel('time');
    ylabel('Protein');
    legend(legend_plot, 'Location', 'southoutside');
end
hold off;



% Pr = P(:,1);
