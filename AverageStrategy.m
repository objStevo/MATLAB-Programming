function [ average ] = AverageStrategy( minFirstRoll,minSecRoll,numGames)
total=0;
for i=1:1:numGames
    total=total+Strategy(minFirstRoll,minSecRoll);
end
average = total/numGames;




