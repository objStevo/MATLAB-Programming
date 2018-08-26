
function [ num ] = rom2num(rom)
%I start a counter at 1 and iterate through the elements of the string from
%left to right. I stop as soon as the counter reaches the end of the string.
s=1;
while (s<(length(rom)+1))
    %Below is my base case, I begin by giving the total the initial value.
    if s==1
        total=Converter(rom(1));
        s=2;
    %After the base case, I continue as instructed. I iterate through the
    %elements of the string. If the subsequent element is less than the
    %previous element, I subtract 2 times the the previous element and add
    %the next element. Otherwise, I continue to increment the total by the
    %respective value of each element. 
    else 
        if (Converter(rom(s))>Converter(rom(s-1)))
            total=total-2*Converter(rom(s-1))+Converter(rom(s));
        else 
            total=total+Converter(rom(s));
        end
        %I increment s so I may iterate through the string. 
        s=s+1;
    end
end
num=total;

end

function [ number ] = Converter( roman )
%Below I have a basic switch statement comparing the input with a roman
%letter index. 
char = roman;
 switch char
    case {'I','i'}
        number=1;
    case {'V','v'}
        number=5;
    case {'X','x'}
        number=10;      
    case {'L','l'}
        number=50;
    case {'C','c'}
        number = 100;
    case {'D' 'd'}
        number = 500;
    case {'M','m'}
        number = 1000;
     otherwise
        number = 2;
 end 
end



