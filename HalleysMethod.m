function [ Approx, Success ] = HalleysMethod( f,xo,MaxIter,Tol )
%--------------------------------------------------------------------------
%Here I am computing the derivatives and assigning them to their respective
%variables.
syms x; 
F(x)=f(x); 
dF(x)=diff(F,x,1);
ddF(x)=diff(F,x,2);
%--------------------------------------------------------------------------
%I need to initiate my loop and assign the old variable the initial value
%of the function.
Iteration=1;
oldGuess = xo;
Error=inf; 
%--------------------------------------------------------------------------
%Here I start by evaluating the functions with their respective inputs for
%that particular cycle. Then I apply Halley's formula
while ((Iteration <= MaxIter) && (Error>Tol))

    a=double(F(oldGuess));
    b=double(dF(oldGuess));
    c=double(ddF(oldGuess));
    
    newGuess = oldGuess - ((2*a*b)/(2*(b^2)-a*c));
%--------------------------------------------------------------------------
%I need to assign the error the value of the function evaulated at newGuess
%for this particular cycle in order to compare it with our tolerance
%upperbound.
    Error=abs(f(newGuess));
    Iteration=Iteration+1;
    oldGuess=newGuess;
    
end
%--------------------------------------------------------------------------
%Lastly, I evaulate the function at the approximate root and compare with
%our tolerance upperbound
Approx=newGuess; 


if (f(Approx)<Tol)
    Success=1;
    fprintf('\n My Approx = %f \n',Approx);
    fprintf('\n Within tolerance \n');
else
    fprintf('\n My Approx = %f \n',Approx);
    Success=0;
    fprintf('\n Not within tolerance \n');
end
%--------------------------------------------------------------------------
%Part B results
fprintf('Part B Results: \n');
fprintf('1. f(x) = x - cos(x), xo=4 -> Within Tolerance, Approx = 0.739085\n');
fprintf('2. f(x) = x^3 - x, xo=1/sqrt(3) -> Within Tolerance, Approx = 0.577350\n');
fprintf('3. f(x) = (x^3)/3 - (x^2)/2 - 6*x + 1, xo=-3 -> Within Tolerance, Approx = -3.652705\n');
fprintf('4. f(x) = 5/6 - (x^2)/2 - cos(x), xo=3 -> Within Tolerance, Approx = 1.524960\n');
fprintf('5. f(x) = x*exp(-x), xo=3/2 -> Within Tolerance, Approx = 16.175005\n');
end



