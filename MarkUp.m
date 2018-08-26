function[C,L]=MarkUp(X)
     C = cell(4,4);
     % First I need to find the candidates of the empty cells and asign it
     % to cell C.
      for i = 1:4
         for j = 1:4 
            if X(i,j)==0 
               z = 1:4; 
               a=1:4;
               %Here I loop though each element of the matrix and compare
               %each of the elements of the row, the column and the
               %subgrid using the ismemeber function as directed.
               Row=ismember(a,X(i,:));   
               z(find(Row')) = 0;
               Col=ismember(a,X(:,j)) ;    
               z(find(Col')) = 0;
               M=ismember(a,X(Subgrid(i):Subgrid(i) + 1,Subgrid(j):Subgrid(j)+1));  
               z(find(M)) = 0 ;
               %Here I assign C element from nonzero element of the Z
               %candidates for the empty box
               C{i,j} = nonzeros(z)';   
            else
                C{i,j}=X(i,j);
            end 
         end 
      end 
      

      
% This is used to find the length of each cell of output C.
L = cellfun(@length,C)  ;    
      
end


