function Encoding(input,output)

f_in  = fopen(input, 'r');
f_out = fopen(output, 'w');
in = fgetl(f_in);
input_num = ALPHtoNUM(in);
n = length(input_num);
output_num = gf(zeros(1, 31*n/15),5);
for i = 1:n/15
    w = input_num((i-1)*15+1:15*i);
    output_num((i-1)*31+1:31*i) = Encode_Word(w);
end
out = NUMtoALPH(output_num);
fwrite(f_out,out);
fclose('all');


