function Decoding(input, output)
%Decodes the 'input' file and puts it in 'output' 
f_in = fopen(input, 'r');
f_out = fopen(output, 'w');
in = fgetl(f_in);
in_num = ALPHtoNUM(in);
n = length(in_num);
output_num = gf(zeros(1, 15*n/31),5);
for i = 1:n/31
    w = in_num((i-1)*31+1:31*i);
    output_num((i-1)*15+1:15*i) = Decode_Word(gf(w,5));
end
out = NUMtoALPH(output_num);
fwrite(f_out,out);
fclose('all');
end

