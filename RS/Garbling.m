function Garbling(input2, output2, error_positions, error_values)

f_in = fopen(input2, 'r');
f_out = fopen(output2, 'w');
f_pos = fopen(error_positions, 'r');
f_val = fopen(error_values, 'r');
input = fgetl(f_in);

positions = fscanf(f_pos, '%d');

values = fscanf(f_val, '%c ');

n = max(size(values));

for i = 1:n
    input(positions(i)) = values(i);
end

fwrite(f_out, input);
fclose('all');

