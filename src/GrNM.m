
% Open channels
in = CisInterface('CisInput', 'GrNM_input');
st = CisInterface('CisInput', 'GrNM_static');
out = CisInterface('CisAsciiArrayOutput', 'GrNM_output', '%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\n');

error_code = 0;

% Receive static input
[flag, Static] = st.recv();
if (~flag)
  disp('GrNM: Failed to receive from GrNM_static.');
  error_code = -1;
end;

global OUTPUT;

% Continue looping until no more input
while(flag)

  % Receive input
  [flag, Input] = in.recv();
  if (~flag)
    disp('GrNM: End of input.');
    break;
  end;

  % Run model
  GrNM_model(Input, Static);
  outdata = OUTPUT{1,1};

  % Send output
  flag = out.send(outdata);
  if (~flag)
    disp('GrNM: Failed to send output to GrNM_output.');
    error_code = -1;
    break;
  end;
end;

exit(error_code);
