% Keep in mind that Pr=P(1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P0=0.1;
Tend=60;

tspan = [0, Tend];
rArray = zeros(size(data_KNO31));
[s1,s2] = size(rArray);

% for i = 1:s1
%     for j = 1:s2
%         rArray(i,j) = mean(cat(2,dataKNO31(i,j),dataKNO32(i,j)),2);
%     end
% end

rArray = cat(2, mean(cat(2,data_KNO31(:,1),data_KNO32(:,1)),2), ...
mean(cat(2,data_KNO31(:,7),data_KNO32(:,7)),2));

% d = 1.75*10^3; % 1.5 for m=1 and 2.1 for m =0.5
% d = max(max(rArray))*2;
d = 3.32;

% % To get all plots with same Y axis, run the model on max value
% max_mn=max(max(rArray));
% [T,P]=ode45(@(T,P) protein(T,P,max_mn,d),tspan,P0);
% max_plot=plot(T,P);
% max_axis=axis;

%         if i == 1
%             title('mRNA to protein for timepoint 0')
%         else
%             title('mRNA to protein for timepoint 20')
%         end

legend_plot = cell(size(2,1));
% time_points = [0,3,6,9,12,15,20];
time_points = [0,20];
n_levels = ['Low N ';...
            'High N'];
protein_levels = cell(size(93,2));

% colorVec=hsv(s2);
figure()
hold on;

for i=1:s1
    subplot(3,5,i)
    for j=1:2
        hold on;
        mn = rArray(i,j);
        [T,P]=ode45(@(T,P) protein(T,P,mn,d),tspan,P0);
%         h1 = plot(T,P, 'Color', colorVec(j,:));
        protein_levels{:,j} = P;
        h1 = plot(T,P);
        set(h1, 'linewidth',1.25);
        title(geneNames{i});
        
        legend_plot{j} = num2str(n_levels(j,:));
        fprintf('d = %s\tm = %s\n', num2str(d), num2str(mn));
        fprintf('p0 = %s\tpf = %s\n', num2str(P0), num2str(P(length(P))));
    end
    xlabel('Time');
    ylabel('Protein');
%     legend(legend_plot)
%     legend('hide')
end
hSub = subplot(3,5,15); plot([1:7],0);
axis off;
[hLegend, iconLegend, plotLegend, strLegend] =legend(legend_plot);
set(hLegend, 'FontSize', 15, 'position', get(hSub, 'position'));
set(iconLegend(:), 'linewidth', 1.25)
hold off;


% legend_plot{j} = strcat('Gene:',  geneNames{j}, ';  m = ', num2str(mn));
% Pr = P(:,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For printing only one graph

figure()
hold on;

for j=1:2
    hold on;
    mn = rArray(1,j);
    [T,P]=ode45(@(T,P) protein(T,P,mn,d),tspan,P0);
    protein_levels{:,j} = P;
    h1 = plot(T,P);
    set(h1, 'linewidth',1.25);
    title(geneNames{14});
    
    legend_plot{j} = num2str(n_levels(j,:));
    fprintf('d = %s\tm = %s\n', num2str(d), num2str(mn));
    fprintf('p0 = %s\tpf = %s\n', num2str(P0), num2str(P(length(P))));
end
xlabel('Time');
ylabel('Protein');

[hLegend, iconLegend, plotLegend, strLegend] =legend(legend_plot);
set(hLegend, 'FontSize', 30, 'Location', 'best');
set(iconLegend(:), 'linewidth', 1.25)
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Keep in mind that Pr=P(1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P0=5;
Tend=240;
tspan = [0, Tend];

figure()
hold on;

r = 20;
d = 100;

[T,P]=ode45(@(T,P) protein(T,P,r,d),tspan,P0);
h1 = plot(T,P);
set(h1, 'linewidth',1.25);
xlabel('Time');
ylabel('Protein');

hold off;
