function c = HeatRandomPoint(M,T,i,j)
% assign initial values
S=0;
s=0;
% run the loop while s remains smaller than T as directed 
while(s<T)
    iold = i;
    jold = j;
    
    %Then I create a matrix for 4 directions of an element
    myDirections = [iold+1, jold; iold-1, jold; iold, jold-1; iold, jold+1];
    
    %From the 4 directions, I select 1 with uniform probability using the
    %datasample function
    y = datasample(myDirections,1);
    
    %Then I assign the selected direction's coordinates to inew and jnew
    inew = y(1);
    jnew = y(2);
    
    % get the size of the Matrix
    [x,y] = size(M);
   
    % iterate over the elements of matrix until you reach the boundary
    % elements. If any of the following four condition is met, it means you
    % have reached the boundary element
    while((inew~=1) & (jnew~=1) & (inew ~= x) & (jnew ~= y))
        iold = i;
        jold = j;
        
        %Then select one direction randomly
        myDirections = [iold+1, jold; iold-1, jold; iold, jold-1; iold, jold+1];
        y = datasample(myDirections,1);
        
        %assign sampled value to inew and jnew
        inew = y(1);
        jnew = y(2);
        
    end
    
    %If I reach a boundary element it means I have traversed one direction. Then sum up
    %the values of the path so I may take the average.
    S = S + M(inew,jnew);
    s = s + 1;
end

%Lastly I take the average of all paths traversed
c = S/T;
end