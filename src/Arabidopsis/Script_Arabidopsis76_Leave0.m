% Copied from Script_Arabidopsis76_Leave1.m
% Leave-none-last analysis, 76 genes, RMA data
% gradient state-space optimization of kinetic equation, linear dynamics
% no data normalization

% Load the 76-gene MAS5 dataset
for k = 1:(length(varargin{1})-1)
    if find(strcmp(varargin{1}{k}, 'gene_dataset_filename'))
        gene_dataset_filename = varargin{1}{k+1};
    end
end

% We could also load the other RMA dataset
load(gene_dataset_filename);

if exist('TFNames', 'var')
    [b,sz_tfs] = size(TFNames);
% else
%     sz_tfs = 23;
end

if exist('geneNames', 'var')
    [sz_genes, b] = size(geneNames);
% else
%     sz_genes = 24;
end
    
% Select data for leave-out-none analysis
% Return <yTrain>, <yTest>, <knownTrain>, <knownTest>,
% <deltaTtrain> and <deltaTtest>
Script_Arabidopsis_DataLeave0;

% Initialize the default parameters:
% * gradient state-space optimization
% * kinetic equation
% * linear dynamics
% * no data normalization

params = DFG_Params_Default_Arabidopsis(sz_genes, sz_tfs, geneNames);

% Compute consistent genes
params = Script_Arabidopsis_ConsistentGenes(params, yTrain, yTest);
