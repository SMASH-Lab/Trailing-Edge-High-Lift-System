function [ ] = saveToFile( filename, col1, col2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% filename : 'results.txt'

N=size(col1,1);
M=size(col2,1);
if(N~=M)
    errore='N diverso da M'
    filename
    return
end
    
% nx=2;
% col1=zeros(nx,1);
% col2=ones(nx,1);
% filename='pippo.txt';

fid = fopen( filename, 'wt' );
fprintf( fid, '[');
i=1;
while (i<N)
    fprintf( fid, '%f,%f;', col1(i),col2(i));
    i=i+1;
end
fprintf( fid, '%f,%f ]', col1(i),col2(i));

fclose(fid);
end

