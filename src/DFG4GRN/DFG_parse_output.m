function [ output ] = DFG_parse_output()
    % Provide predicted output of mRNA levels
    
    global OUTPUT;
    global geneNames;
    global nonTFNames;
    global KNO3;
    
    outdata = OUTPUT{1,1};
    [~, idxsInGeneNames] = intersect(nonTFNames, geneNames);
    length_match = length(idxsInGeneNames);
    
    % Get average original gene expression at last time point in treatment
    avg_genes = zeros(1,length(geneNames));
    for i=1:length(geneNames)
        avg_genes(i) = mean(KNO3(1,end), KNO3(:,end));
    end
    
    output = zeros(length_match,2);
    for i=1:length(length_match)
        counter = length_match(i);
        output(i,1) = geneNames(counter);
        output(i,2) = avg_genes(counter) * mean(outdata(counter,:));
    end
end