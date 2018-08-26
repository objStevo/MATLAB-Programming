function [ Wins ] = Strategy( Roll1,Roll2 )
%   First I assign the value of three different rolls to their respective
%   variable. Although this may be inefficent, since we can create each new
%   variable if the roll before does not satisfy the minimum condition, it organizes the code and efficiency is not a priority. 

firstRoll = ceil(6*rand());
secondRoll = ceil(6*rand());
thirdRoll = ceil(6*rand());

%Next, I compare each roll in order. Notice as soon as the roll satisfies
%our minimum condition we return the respective value. 
if (firstRoll<=Roll1)
    Wins = firstRoll;
    return
elseif (secondRoll<=Roll2)
    Wins=secondRoll;
    return
else
    Wins = thirdRoll; 
end

end

