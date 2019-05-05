function[I]=Simpson(x,y)
%This function inputs two intervals and calculates the integral under both
%intervals using the simpsons 1/3 rule (I=((b-a)/6)(f(a)+4f((b-a)/2)+f(b))
%and the trapezoidal rule (I=((b-a)/2(f(a)+f(b))if they are odd. The 
% intervals must be the same length and x must be equally spaced.


%errors
if nargin>2
    error('Must input x and y')
elseif length(x)~=length(y)
    error('Intervals must be equal in length')
elseif isequal(diff(x),circshift(diff(x),1))==0
    error('x must be equally spaced')
else
end


%determine if the trapezoidal rule needs to be used
if floor(length(x)/2)==length(x)/2
   Simpsons=0;
   warning('Trapezoidalrule will be used for the last interval')
else
    Simpsons=1;
end


if Simpsons==1
    
    %determine the integral with just the simpsons method
    for iteration=1:length(x)/2
        simpson_array=[1 2 3];
        simpson_array=simpson_array+2*(iteration-1);
        simsum(iteration)=1/6*(x(simpson_array(3))-x(simpson_array(1)))*(y(simpson_array(2))+4*y(simpson_array(2))+y(simpson_array(3)));
    end
    
else %Simpsons=1
    
    for iteration=1:floor(length(x)/2)-1 %use the simpsons method to calculate most of the integral
        simpson_array=[1 2 3];
        simpson_array=simpson_array+2*(iteration-1);
        simsum(iteration)=1/6*(x(simpson_array(3))-x(simpson_array(1)))*(y(simpson_array(2))+4*y(simpson_array(2))+y(simpson_array(3)));
    end %use the trapezoidal method to calculate the last part of the integral
    
    simsum(iteration+1)=(x(length(x))-x(length(x)-1))*(y(length(y))+y(length(y)-1))/2;
    
end

I=sum(simsum);

end