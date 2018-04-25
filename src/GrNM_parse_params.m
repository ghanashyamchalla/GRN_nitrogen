
function [n_conc, n_models, script, tau, gamma, lambda] = GrNM_parse_params(params_input)

  % Set default values
  n_models = 2;
  script = 'Script_Arabidopsis76_Leave1_LARS';
  tau = 3;
  gamma = 0.1;
  lambda = 0.1;

  if isa(params_input, 'containers.Map')
    if isKey(params_input, 'nitrate')
       n_conc = params_input('nitrate');
    end;
    if isKey(params_input, 'n_models')
      n_models = params_input('n_models');
    end;
    if isKey(params_input, 'script_name')
      script = params_input('script_name');
    end;
    if isKey(params_input, 'tau')
      tau = params_input('tau');
    end;
    if isKey(params_input, 'gamma')
      gamma = params_input('gamma');
    end;
    if isKey(params_input, 'lambda')
      lambda = params_input('lambda');
    end;

  else if isa(params_input, char)
    params_data = readtable(params_file, 'Delimiter', 'tab', 'ReadVariableNames', false);
    params_cell = params_data{:, :};
    for k = 1:length(params_cell)
        if strcmp(params_cell{k}, 'nitrate')
            n_conc = params_cell{k+1};
        end
        if strcmp(params_cell{k}, 'n_models')
            n_models = params_cell{k+1};
        end
        if strcmp(params_cell{k}, 'script_name')
            script = params_cell{k+1};
        end
        if strcmp(params_cell{k}, 'tau')
            tau = params_cell{k+1};
        end
        if strcmp(params_cell{k}, 'gamma')
            gamma = params_cell{k+1};
        end
        if strcmp(params_cell{k}, 'lambda')
            lambda = params_cell{k+1};
        end
    end
  else 
    error('Could not parse input.');
  end;

end
