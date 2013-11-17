function [alph] = NUMtoALPH(num)
%Translate a string of numbers in to corresponding letters
n = length(num);
alph = zeros(1,n);
for i = 1:n
    x = num(i);
    if x == 0
        alph(i) = 'A';
    elseif x == 1
        alph(i) = 'B';
    elseif x == 2
        alph(i) = 'C';
    elseif x == 3
        alph(i) = 'D';
    elseif x == 4
        alph(i) = 'E';
    elseif x == 5
        alph(i) = 'F';
    elseif x == 6
        alph(i) = 'G';
    elseif x == 7
        alph(i) = 'H';
    elseif x == 8
        alph(i) = 'I';
    elseif x == 9
        alph(i) = 'J';
    elseif x == 10
        alph(i) = 'K';
    elseif x == 11
        alph(i) = 'L';
    elseif x == 12
        alph(i) = 'M';
    elseif x == 13
        alph(i) = 'N';
    elseif x == 14
        alph(i) = 'O';
    elseif x == 15
        alph(i) = 'P';
     elseif x == 16
        alph(i) = 'Q';
    elseif x == 17
        alph(i) = 'R';
    elseif x == 18
        alph(i) = 'S';
    elseif x == 19
        alph(i) = 'T';
    elseif x == 20
        alph(i) = 'U';
    elseif x == 21
        alph(i) = 'V';
    elseif x == 22
        alph(i) = 'W';
    elseif x == 23
        alph(i) = 'X';
    elseif x == 24
        alph(i) = 'Y';
    elseif x == 25
        alph(i) = 'Z';  
    elseif x == 26
        alph(i) = ' ';
    elseif x == 27
        alph(i) = ',';
    elseif x == 28
        alph(i) = '.';
    elseif x == 29
        alph(i) = '?';
    elseif x == 30
        alph(i) = '!';
    elseif x == 31
        alph(i) = ':';   
    end       
end
alph = char(alph);
return;
end

