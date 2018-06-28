%> This script is based on the Tutorial.m file from SSM model by Piotr
%> Mirowski. I have modified the files to accept a parameter file which
%> can be modified to integrate with MDS model.
%> Author: Stuti Shrivastava


function GrNM_model (Input, Static)
    
    addpath(genpath('./'));
    
    %> Read params file and call the model
    [n_conc, n_models, script_name, ...
     tau_val, gamma_val, lambda_val] = GrNM_parse_params(Input);

    %> Learn multiple models
    GRN_Batch_MultiModel_AR1(n_models, script_name, ...
        'file_type', 1, ...         % 1 = string, 0 = filename
        'gene_dataset_filename', Static, ...
        'tau', tau_val, ...         % Kinetic time coefficient
        'gamma', gamma_val, ...     % Weight of the dynamic error
        'lambda_w', lambda_val, ... % L-1 regularization coefficient
        'n_steps_display', 0, ...
        'verbosity_level', 0);
end