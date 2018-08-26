function[W]=Shidoku(X)

%First I check if all the elements of the matrix X are nonzero. If they are
%then I output x. 
if all(X(:))==1   
    W=X;          
else
    %Otherwise I mark the empty cells with possible candidates
    [C,L]=MarkUp(X);   
    %if no candidates are assigned than their is no solution, output grid
    %
    if all(L(:))==0    
        W=X;
    %Otherwise, i check for singletons, and if I find them make them
    %members of the Shidoku
    elseif any((X==0)&(L==1))==1    
        [Row,Col]=find((X==0)&(L==1),16);
        Row=Row';
        Col=Col';
        n=length(Row);
        m=length(Col);
        Y=X;
        for i=1:1:n
            for j=1:1:m
            Y(Row(i),Col(i))=C{Row(i),Col(i)}(1,1);   
            end
        end
        %Then recursively call the function so it may mark the candidates
        W=Shidoku(Y);  
        %if I find no singleton, then iterate over the candidates,
        %insert a new candidate in the block and recursively call the
        %function.
    elseif any(X(:) == 0)
                Y = X;
                z = find(X(:) == 0,1);     
                 for r = [C{z}]            
                      X = Y; 
                      X(z) = r;               
                      X = Shidoku(X);          
                      if all(X(:) > 0)      
                          W=X;
                            return;
                      end 
                 end       
    end
end

end

        
