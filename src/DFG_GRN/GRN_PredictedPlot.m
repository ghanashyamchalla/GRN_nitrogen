% GRN_Plot  Plot a gene prediction for each gene at the end

function GRN_PredictedPlot(len_total, len_seq, yVal, col1,zStarVal, col2)

figure;

title('Gene Plot');
xlabel('Expression data');
ylabel('Time points');

plot(len_total + [1:len_seq], yVal, col1, ...
    len_total + [1:len_seq], zStarVal, col2);


% ny = size(mat,1);
% nx = size(mat,2);
% set(gca, 'XTick', [1:nx], 'YTick', [1:ny], 'FontSize', 8);
% set(gca, 'YTickLabel', ylab, 'XTickLabel', {});
% grid on;
% if isempty(xlab)
%   xlab = ylab;
% end
% for k = 1:nx
%   text(k, ny+0.51, xlab{k}, 'Rotation', 90, ...
%     'HorizontalAlignment', 'right', 'FontSize', 8);
end
% set(gcf, 'Position', [50 50 1000 1000]);
