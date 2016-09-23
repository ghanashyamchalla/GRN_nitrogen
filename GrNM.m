import PsiInterface.*

addpath (genpath ('./'));

    in = py.PsiInterface.PsiInput('GrNM_input1');
    st = py.PsiInterface.PsiInput('GrNM_static');
    out = py.PsiInterface.PsiOutput('GrNM_output');

    Input = in.recv()
    Static = st.recv()
    
    global OUTPUT
    GrNM_model(Input, Static);
    outdata = OUTPUT{1,1};

    formatSpec_out = '%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\t%+.6f\n';
    sOutput = sprintf(formatSpec_out, outdata);
    
    out.send(sOutput);

exit();
