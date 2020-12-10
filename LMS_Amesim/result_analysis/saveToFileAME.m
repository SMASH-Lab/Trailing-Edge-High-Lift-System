function [ ] = saveToFileAME( filename, col1, col2 )
%UNTITLED2 Salva due vettori colonna su file per le tabelle AMESim
%   Detailed explanation goes here
% filename : 'results.txt'

N=size(col1,1);
M=size(col2,1);
if(N~=M)
    errore='N diverso da M'
    filename
    return
end
    

fid = fopen( filename, 'wt' );
i=1;
while (i<=N)
    fprintf( fid, '%f %f \n', col1(i),col2(i));
    i=i+1;
end

fclose(fid);
end

