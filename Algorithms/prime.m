function[pr]=prime(m,n)
% This script finds all of the prime numbers between inputed number m and
% inputted number n if they are both positive intgers and n is greater than
% m

%m=input('Enter m:');
%n=input('Enter n:');

% displays errors if the inputs do not fit the criteria of positive
% integers and n is larger than m
if n<0
    error('The input argument must be a positive integer.')
elseif floor(n)~=n
    error('The input argument must be a positive integer.')
elseif m<0
    error('The input argument must be a positive integer.')
elseif floor(m)~=m
    error('The input argument must be a positive integer.')
elseif m>n
    error('The value of n must be larger than the value of m')
else

pr=[]; %sets up an array for the loops to fill, to display the answers   
for search=m:n %loops through all values from the first input to the last input
    hitbreak=0;
    for calculate=2:(search-1)%loops through all values from 2 to the input
    if mod(search,calculate)==0 %determines if the current number is prime, and breaks the loop if it is not
        hitbreak=1;
        break
    end
    end
    if hitbreak==0
        pr=[pr,search];%fills the array to display the answers
    end
end

end
end 



