function Mt = HeatAverage(M,T)
%define the cell with T subcells
Mt = cell(T,1);

%I store the original matrix in the first subcell as directed . 
Mt{1} = M;

% Since T1 is the original matrix, I only need to run the loop from the
% second subcell
for i = 2:T
    
    %I create a temporary matrix equal to the first matrix. For the first
    %iteration Mat will contain the original matrix only, so that I have the
    %initial values of the function. Since I start the counter i at 2, then (i-1) represents the first cell.
    Mat = Mt{i-1};
    %Then I create another temporary matrix that will store the new values.
    new_M = Mat;
    %Then I need to find the size of the matrix so I may make the proper number ofiterations.
    
    [x, y] = size(Mat);
    
    % Instead of running through each position of the matrix with the condition. I will run the for
    % loop for only the inner values, since I do not want to change the boundary values, we. That is why I start j and k from 2 and end
    % the loop before n-1 
    % Thus the algorithm is more efficient. 

    for j = 2: (x-1)
        for k = 2: (y-1)
            % As directed I change the value by taking the average of the 4
            % elements above, below, to the right and to the left of (0,0)
            new_M(j,k) = 1/4*(Mat(j-1,k)+Mat(j+1,k)+Mat(j-1,k-1)+Mat(j,k-1));
        end
    end
    % Lastly, I store the new matrix in the cell array
    Mt{i} = new_M;
end            
end