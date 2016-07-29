#!/bin/bash

# ----------------Your Commands------------------- #

matlab -nodisplay -nosplash -r "addpath('./src'); SaM('./Input/SaM_input.txt','./Output/SaM_output.txt'); exit;"
