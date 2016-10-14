% Leave-out-last analysis, 76 genes, RMA data
% gradient state-space optimization of kinetic equation, linear dynamics
% no data normalization

% Load the 76-gene MAS5 dataset
for k = 1:length(varargin{1})
    if find(strcmp(varargin{1}{k}, 'gene_dataset_filename'))
        gene_dataset_filename = varargin{1}{k+1};
    end
end


[dataKCL1, dataKCL2, dataKNO31, dataKNO32, dataKnown, deltaT, nComb, ...
    KCl, KNO3, geneNames, TFNames, nonTFNames] = ...
    GRN_ReadDatafile(gene_dataset_filename);

if exist('TFNames', 'var')
    [~,sz_tfs] = size(TFNames);
end

if exist('geneNames', 'var')
    [sz_genes, ~] = size(geneNames);
end

% Select data for leave-out-1 analysis
% Return <yTrain>, <yTest>, <knownTrain>, <knownTest>,
% <deltaTtrain> and <deltaTtest>
Script_Arabidopsis_DataLeave1;

% Initialize the default parameters:
% * gradient state-space optimization
% * kinetic equation
% * linear dynamics
% * no data normalization

params = DFG_Params_Default_Arabidopsis(sz_genes, sz_tfs, geneNames);

% Compute consistent genes
params = Script_Arabidopsis_ConsistentGenes(params, yTrain, yTest);
