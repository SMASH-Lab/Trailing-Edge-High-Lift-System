
nx=2;
col1=zeros(nx,1);
col2=ones(nx,1);
filename='pippo.txt';
N=size(col1,1);
fid = fopen( filename, 'wt' );
fprintf( fid, '[');
for i = 1:N-1
    fprintf( fid, '%f,%f;', col1(i),col2(i));
end
fprintf( fid, '%f,%f ]', col1(i),col2(i));

fclose(fid);