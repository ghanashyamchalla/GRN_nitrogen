% GRN_Batch_MultiModel_AR1
% Copyright (C) 2010 Piotr Mirowski
%
% This is the entry point for learning multiple instance of a GRN. When the
% computation is done, the function generates 4 global variables:
%   MODEL
%   METER_LEARN
%   METER_INFER_TRAIN
%   METER_INFER_TEST
% These are cell arrays indexed by the number <model_num> of the instance.
%
% The handling of parameters is as following: for instance, to call the 
% script on the Arabidopsis data, learn models, with 
% kinetic coefficient tau=3.5,
% latent variable inference rate eta_z=0.1,
% and L1-regularization rate lambda=0.001, 
% then compute a statistically significant GRN, and then save results to file
% './Arabidopsis_test.mat', one needs to call:

% GRN_Batch_MultiModel_AR1(12, 'Script_Arabidopsis_LeaveNone', ...
%                          '.', 'Arabidopsis_test', ...
%                          'eta_z', 0.1, 'tau', 3.5, 'lambda', 0.001);
%
% If an alternative dataset is to be substituted to the one in the script,
% use argument pair ('gene_dataset_filename', FILENAME),
% as in ('gene_dataset_filename', 'DREAM3_InSilicoSize10_1.mat').
%
% Before starting this batch process, add the directory to the path
% using the ADDPATH function.
%
% Syntax:
%   GRN_Batch_MultiModel_AR1(n_models, ...
%                            script_name, dir_res, file_res, varargin)
% Inputs:
%   n_models:     number of models
%   script_name:  filename of the Matlab script that loads the data
%                 and sets the parameters
%   dir_res:      path (directory) of <file_res>
%   file_res:     filename of the file containing the results
%   varargin:     additional arguments, going by pairs
% Outputs:
%   params:       parameter struct

function GRN_Batch_MultiModel_AR1(n_models, script_name, varargin)

for k = 1:(length(varargin)-1)
    if find(strcmp(varargin{k}, 'gene_dataset_filename'))
        gene_dataset_filename = varargin{k+1};
    end
end

% Create <n_models> using same script and data, and do not save results yet
for model_num = 1:n_models
  params = GRN_Batch_AR1(model_num, script_name, varargin);
end

% Compute statistics on the average model
GRN_EvaluateModels_AR1(params, script_name, varargin);

end

