function[root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%This function finds the root of an imputed equation (that must be 
%symbolized by saying fx=@(x)*function* and calling @x within the function)
%by drawing a line between the two guesses given (upper and lower) and
%then replaces either the upper or lower (whichever has the same sign as
%the new guess) with the new guess. This function calculates the percent
%approximate relative error (ea) of the root after stopping at the desired
%relative error (es defaluts to 0.0001%) or the number of iterations
%specified (maxiter defalts to 200) whichever comes first. 
%NOTE: The upper and lower imputs MUST be on opposite sides of the x axis
%otherwise the function will not work.

format long
%defalt settings
if nargin==4
    %if there are only 4 inputs, default the maximum number of iterations
    %to 200
    maxiter=200;
elseif nargin==3
    %if there are only 3 inputs, default the maximum nuber of iterations to
    %200 and the percent error to 0.0001%
    maxiter=200;
    es=0.0001;

else
end

f_xl=func(xl);
f_xu=func(xu);
%errors
if f_xl>0 && f_xu>0
    error("f(xl) must have a different sign then f(xu)")
elseif (f_xl<0 && f_xu<0)
    error("f(xl) must have a different sign then f(xu)")
elseif nargin<3;
    error("must have a function, xl, and xu")
else
end

%starts the iteration counter at 0
iter=0; 

while (1)
    %calculate the falseposition by drawing a line between the two points
    %of interest
    xr=xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); 
    if (func(xr)>0 && func(xu)>0)||(func(xr)<0 && func(xu)<0)
        %deterimine if xr and xu have the same sign
        %calculate the error using xu as the previous guess
        ea=abs((xr-xu)/xr)*100; 
        %replace xu with xr
        xu=xr; 
    else
        %calculate the error using xl as the privious guess
        ea=abs((xr-xl)/xr)*100; 
        %replace xl with xr
        xl=xr;
    end
    %count the number of iterations
    iter=iter+1;
    if (ea<=es)||(iter>=maxiter)
        %if the calculated error is greator than or equal to the preffered
        %error - stop the loop
        %if the number of iterations is greator than or equal to the
        %maximum number of iteration - stop the loop
        break
    end
end

root=xr;
fx=func(xr);

fprintf('\n The root plugged into the function is %.4f',fx)
fprintf('\n The relative percent error of the root is %.15d percent',ea)
fprintf('\n It took %.3f iterations to reach the root',iter)
fprintf('\n The root of the function is')
end


    


        