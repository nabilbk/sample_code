function [num] = ALPHtoNUM(alph)
%Translate a string of letters to appropriate numbers
n = length(alph);
num = zeros(1,n);
for i = 1:n
    x = alph(i);
    if x == 'A'
        num(i) = 0;
    elseif x == 'B'
        num(i) = 1;
    elseif x == 'C'
        num(i) = 2;
    elseif x == 'D'
        num(i) = 3;
    elseif x == 'E'
        num(i) = 4;
    elseif x == 'F'
        num(i) = 5;
    elseif x == 'G'
        num(i) = 6;
    elseif x == 'H'
        num(i) = 7;
    elseif x == 'I'
        num(i) = 8;
    elseif x == 'J'
        num(i) = 9;
    elseif x == 'K'
        num(i) = 10;
    elseif x == 'L'
        num(i) = 11;
    elseif x == 'M'
        num(i) = 12;
    elseif x == 'N'
        num(i) = 13;
    elseif x == 'O'
        num(i) = 14;
    elseif x == 'P'
        num(i) = 15;
     elseif x == 'Q'
        num(i) = 16;
    elseif x == 'R'
        num(i) = 17;
    elseif x == 'S'
        num(i) = 18;
    elseif x == 'T'
        num(i) = 19;
    elseif x == 'U'
        num(i) = 20;
    elseif x == 'V'
        num(i) = 21;
    elseif x == 'W'
        num(i) = 22;
    elseif x == 'X'
        num(i) = 23;
    elseif x == 'Y'
        num(i) = 24;
    elseif x == 'Z'
        num(i) = 25;  
    elseif x == ' '
        num(i) = 26;
    elseif x == ','
        num(i) = 27;
    elseif x == '.'
        num(i) = 28;
    elseif x == '?'
        num(i) = 29;
    elseif x == '!'
        num(i) = 30;
    elseif x == ':'
        num(i) = 31;   
    end;        
end 
return;
end

