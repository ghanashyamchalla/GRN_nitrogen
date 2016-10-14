function [dataKCL1, dataKCL2, dataKNO31, dataKNO32, dataKnown, deltaT, ...
        nComb, KCl, KNO3, geneNames, TFNames, nonTFNames] = GRN_ReadDatafile(filedata)
    
    % Save all data as columns and rows
    all_rows = strsplit(filedata, '\r');
    if (length(all_rows) == 1)
        all_rows = strsplit(filedata, '\n');
    end
    header_row = strsplit(all_rows{1}, '\t');
    nCols = length(header_row);
    nRows = length(all_rows);
    
    static_data = cell([nRows nCols]);
    
    for k = 1:nRows
        static_data(k,:) = regexp(all_rows{k}, '\t', 'split');
    end
     
    geneNames = static_data(2:15,1);
    TFNames = geneNames(1:13,1)';
    nonTFNames = geneNames(14,1)';
    
    dataKCL1 = cellfun(@str2num, static_data(2:15,2:8));
    dataKCL2 = cellfun(@str2num, static_data(2:15,9:15));
    dataKNO31 = cellfun(@str2num, static_data(2:15, 16:22));
    dataKNO32 = cellfun(@str2num, static_data(2:15, 23:29));
    
    dataKnown = {logical(dataKCL1),logical(dataKCL2),logical(dataKNO31),logical(dataKNO32)};
    
    KCl = {dataKCL1; dataKCL1; dataKCL2; dataKCL2};
    KNO3 = {dataKNO31; dataKNO31; dataKNO32; dataKNO32};
    
    deltaT = [3,3,3,3,3,5];
    nComb = 4;
    
    clear fid fmt isStrCol line data;
end
