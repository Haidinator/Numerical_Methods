function [L,U,P]=luFactor(A)
% The function does LU factorization for any square matrix. LU 
% factorization uses Guass elimination to eliminate varibles and inputs 
% the numbers used to eliminate the varibles into L and U marticies so 
% that L*U=the original matrix. Pivoting allows the factorization to work 
% on any matrix so the (L*U)/P=the original matrix. This function outputs an 
% L,U and P matrix. 

format short

% errors
[m,n] = size(A);
if m>n || m<n
    error('Matrix must be square')
end

% create an identiy matrix of A
P = eye(n); 

% define initial conditions for the loop
U = A; 
L = P;

for row = 1:n %figure out where needs to pivot
    [not column] = max(abs(U(row:n,row)));
    column = column+row-1;
    %pivot
    if column ~= row 
        % interchange column and row in U to pivot
        skeleton = U(row,:);
        U(row,:) = U(column,:);
        U(column,:) = skeleton;
        % interchange column and row in P to keep track of the pivots
        skeleton = P(row,:);
        P(row,:) = P(column,:);
        P(column,:) = skeleton;
        % change the L matrix to reflect the pivots
        if row >= 2
            skeleton = L(row,1:row-1);
            L(row,1:row-1) = L(column,1:row-1);
        end
    end
    %create the matricies for L and U
    for u = row+1:n 
        L(u,row) = U(u,row)/U(row,row);
        U(u,:) = U(u,:)-L(u,row)*U(row,:);
    end
end

% display the matricies
U = U
P = P
fprintf('The L matrix of the function is')
end
