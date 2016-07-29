% DFG_Trace_AR1_Id_NRT  Trace the results during learning
%
% Syntax:
%   DFG_Trace_AR1_Id(y, zStar, k, n_epochs, model_num)

% Copyright (C) 2009 Piotr Mirowski
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% Version 1.0, New York, 08 November 2009
% (c) 2009, Piotr Mirowski,
%     Ph.D. candidate at the Courant Institute of Mathematical Sciences
%     Computer Science Department
%     New York University
%     719 Broadway, 12th Floor, New York, NY 10003, USA.
%     email: mirowski [AT] cs [DOT] nyu [DOT] edu

% Revision 1: display F1, Jaccard and AUC of ROC if known GRN
%             use red/blue colormap
%             monitor the direction of predictions
% Revision 2: bug when missing target GRN
%             show gene names

function DFG_Trace_AR1_Id_NRT(y, zStar, zStarOut, model_num)

global MODEL
global METER_INFER_TRAIN
global METER_INFER_TEST
global METER_LEARN

figure();
cla; hold on;
len_total = 0;
n_seq = length(y);

for j = 1:n_seq
  len_seq = size(y{j}, 2);
  plot(len_total + [1:len_seq], y{j}(14,:)', 'b', ...
    len_total + [1:len_seq], zStar{j}(14,:)', 'r');
  for i = 1:(len_seq-1)
    plot(len_total + [i (i+1)], [y{j}(14, i) zStarOut{j}(14, i)], 'g');
  end
  len_total = len_total + len_seq;
end

title('NRT1.1 predictions')