%> This script is based on the Tutorial.m file from SSM model by Piotr
%> Mirowski. I have modified the files to accept a parameter file which
%> can be modified to integrate with MDS model.
%> Author: Stuti Shrivastava


function GrNM_model (Input, Static)
    
    addpath(genpath('../src/'));
    
    %> Read params file and call the model
    % params_data = readtable(params_file, 'Delimiter', 'tab', 'ReadVariableNames', false);
    params_data = cellstr(strsplit(char(Input)));
    
    for k = 1:length(params_data)
        if strcmp(params_data{k}, 'nitrate')
            n_conc = params_data{k+1};
        end
        if strcmp(params_data{k}, 'n_models')
            n_models = params_data{k+1};
        else
            n_models = 2;
        end
        if strcmp(params_data{k}, 'script_name')
            script_name = params_data{k+1};
        else
            script_name = 'Script_Arabidopsis76_Leave1_LARS';
        end
        if strcmp(params_data{k}, 'tau')
            tau_val = params_data{k+1};
        else
            tau_val = 3;
        end
        if strcmp(params_data{k}, 'gamma')
            gamma_val = params_data{k+1};
        else
            gamma_val = 0.1;
        end
        if strcmp(params_data{k}, 'lambda')
            lambda_val = params_data{k+1};
        else
            lambda_val = 0.1;
        end
    end
    
    static_file = char(Static);
    
    
    %> Learn multiple models
    GRN_Batch_MultiModel_AR1(n_models, script_name, ...
        'file_type', 1, ...         % 1 = string, 0 = filename
        'ko', {0}, ...         % data row number for gene to knockout
        'gene_dataset_filename', static_file, ...
        'tau', tau_val, ...         % Kinetic time coefficient
        'gamma', gamma_val, ...     % Weight of the dynamic error
        'lambda_w', lambda_val, ... % L-1 regularization coefficient
        'n_steps_display', 0, ...
        'verbosity_level', 0);

end
