function Pprime = protein(T, P, r, d)

% model parameters (taken from page 9 of the report, when available)
L=0.4/24;   % Protein synthesis rate as per min (0.4 per day) Li et al 2012
U=0.28/24;   % Protein degradation rate as per min (0.28 per day) Li et al 2012
% d1= 0.01;      % effectiveness factor
% r1=2;       % mRNA concentration
% r = interp1(rt, r, t);
% r = 1;

% Variable (namely, protein)
Pr=P(1);			% Protein
% fprintf('L1 = %s\n', num2str(L1));
% fprintf('U1 = %s\n', num2str(U1));
% fprintf('d1 = %s\n', num2str(d1));
% fprintf('r1 = %s\n', num2str(r1));

% ordinary differential equation (based on equation (17))
dPr = 1./(1+Pr/d)*L*r - U*Pr;

Pprime=dPr;