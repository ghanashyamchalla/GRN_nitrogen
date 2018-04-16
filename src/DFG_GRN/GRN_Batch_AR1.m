% GRN_Batch_AR1
% Copyright (C) 2009 Piotr Mirowski

% This is the entry point for learning one instance of a GRN. When the
% computation is done, the function generates 4 global variables:
%   MODEL
%   METER_LEARN
%   METER_INFER_TRAIN
%   METER_INFER_TEST
% These are cell arrays indexed by the number <model_num> of the instance.
%
% The handling of parameters has been replaced. So, for instance, to call
% the script on the Arabidopsis data, run it as the 12th model,
% with kinetic coefficient tau=3.5,
% latent variable inference rate eta_z=0.1,
% and L1-regularization rate lambda=0.001, and then save results to
% file 'Arabidopsis_12_test.mat',
% one now needs to call:
%
% GRN_Batch_AR1(12, 'Script_Arabidopsis_LeaveNone', ...
%               'Arabidopsis_12_test', ...
%               'eta_z', 0.1, 'tau', 3.5, 'lambda', 0.001);
%
% If an alternative dataset is to be substituted to the one in the script,
% use argument pair ('gene_dataset_filename', FILENAME),
% as in ('gene_dataset_filename', 'DREAM3_InSilicoSize10_1.mat').
%
% Before starting this batch process, add the directory to the path
% using the ADDPATH function.
%
% Syntax:
%   GRN_Batch_AR1(model_num, script_name, file_res, varargin)
% Inputs:
%   model_num:    number you give to the model and results, for storage
%   script_name:  filename of the Matlab script that loads the data
%                 and sets the parameters
%   file_res:     filename of the file containing the results
%   varargin:     additional arguments, going by pairs
% Outputs:
%   params:       parameter struct

function params = GRN_Batch_AR1(model_num, script_name, varargin)

% Initialization
% --------------

DFG_InitOctave;
addpath('src/libs/bolasso/');

for k = 1:(length(varargin)-1)
    if find(strcmp(varargin{k}, 'gene_dataset_filename'))
        gene_dataset_filename = varargin{k+1};
    end
end

% Evaluate the script (which loads a dataset, defines a few variables,
% and initializes the parameters)

eval(script_name);
if ~exist('params', 'var'), error('Need to define <params>'); end
if ~exist('yTrain', 'var'), error('Need to define <yTrain>'); end
if ~exist('yTest', 'var'), error('Need to define <yTest>'); end
if ~exist('knownTrain', 'var'), error('Need to define <knownTrain>'); end
if ~exist('knownTest', 'var'), error('Need to define <knownTest>'); end
if ~exist('deltaTtrain', 'var'), error('Need to define <deltaTtrain>'); end
if ~exist('deltaTtest', 'var'), error('Need to define <deltaTtest>'); end


% Additional handling of command line parameters
% ----------------------------------------------
% All changes to the parameters are handled by the following function:
params = DFG_Params_Modify(params, varargin);


% Run the model
% -------------

% Normalize the data if required
if (params.normalize_data)
  [yTrain, yTest, params] = GRN_Normalize(yTrain, yTest, params);
end

if (params.verbosity_level > 0)
    fprintf(1, 'Computing model %d...\n', model_num);
end

DFG_Learn(yTrain, knownTrain, yTest, knownTest, ...
  params, model_num, deltaTtrain, deltaTtest);


% Save the results of an individual run (optional)
% ------------------------------------------------
% if strcmp(save_opt, 'all')
%     if ~isempty(file_res)
%         if ~isequal(lower(file_res((end-3):end)), '.mat')
%             file_res = [file_res '.mat'];
%         end
%         global MODEL
%         global METER_LEARN
%         global METER_INFER_TRAIN
%         global METER_INFER_TEST
%         save([dir_res '/' file_res], 'MODEL', 'params', ...
%             'METER_LEARN', 'METER_INFER_TRAIN', 'METER_INFER_TEST');
%     end
% end

