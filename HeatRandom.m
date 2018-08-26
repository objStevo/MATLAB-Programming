function Mt = HeatRandom(M,T)
    % First I get the size of the matrix so that I can find the boundary elements
    [x y] = size(M);
    
    % I assign the matrix M to new matrix Mt to be returned
    Mt = M;
    
    % Again, as in the previous approach I run the for
    % loop only for only the inner values. That is why i and j start from 2 and end
    % before n-1. And since Mt is similar to M, it has the same boundary
    % values.
    for i = 2:x-1
        for j = 2:y-1
            
            %call the HeatRandomPoint for inner values of the matrix and
            %assign the returning values to Mt matrix
            Mt(i,j) = HeatRandomPoint(M,T,i,j);
        end
    end
    
end