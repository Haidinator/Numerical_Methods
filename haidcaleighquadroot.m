%% Loops II
% Caleigh Haid
% Nov 5th, 2018
% This program calculates the quadratic formula, ax^2+bx+c=0, for any given
% a,b, and c.

clear
% defines a by asking the user to input a value% defines a
a=input('Enter a:');

% defines b by asking the user to input a value
b=input('Enter b:');

% defines c by asking the user to input a value
c=input('Enter c:');

% calculates the determinent
D=b^2-(4*a*c);

% deterimines if there are 1, 2 or no real roots
if D<0
    % displays if there are no real roots
    fprintf('\n The equation has no real roots')
elseif D>0
    % displays and calculates if there are 2 real roots
    R1=((-b+sqrt(D))/(2*a));
    R2=(-b-(sqrt(D))/(2*a));
    fprintf('The equation has two roots:\n %.3f and %.3f',R1,R2)
else 
    %displays and calculates if there is one real root
    R=-b/(2*a); 
    fprintf('The equation has one root:\n %d',R)
end
    