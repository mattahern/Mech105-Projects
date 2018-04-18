function [L, U, P] = luFactor(A)
%The function luFactor performs an lu factorization on the the input matrix
%[A]. [A] must be a square matrix as the function uses Gauss elimination with pivoting to determine the
%values of matrices [L], [U], and [P]. These can then be used to solve for
%the unknowns within the system of equations.
%From the lu factorization it is found that:
%                           [P][A] = [L][U]
%Inputs:
%   A - the square coefficient matrix in which lu factorization is to be performed
%Outputs:
%   L - the lower triangular matrix found using lu factorization
%   U - the upper triangular matrix found using lu factorization
%   P - the pivot matrix which is the orginal identity matrix of [A]
%       pivoted along with the matrix [A] during lu factorization.

if nargin < 1 || nargin > 1 %Checks to make sure there is only one input
    error('Function can only have one input value A. Read help for clarification.')
end

[m,n]= size(A); %m is the number of rows and n is the number of columns of A
if m ~= n %m and n must be equal creating a sqaure matrix so that lu factorization can be performed
  error('[A] needs to be a square matrix to perform lu factorization');
end

P = eye(m,n); %Matrix [P] is intially created as an identity matrix of [A]
L = eye(m,n); %Matrix [L] is also intially created as an identity matrix of [A]
U = A; %Matrix [U] is initially created as being equal to matrix [A]

for i=1:n % Loops from the first to the nth column
    [col_max,m] = max(abs(U(i:n,i))); %Determines the maximum value in the ith column of matrix [U]
    m = m + i - 1; %Determines which row m is to be pivoted
    if m ~= i %As long as the mth row is not equal to the ith row pivoting takes place
        %x stores the value of the row i that is being replaced due to pivoting
        x = U(i,:);
        %Matrix is pivoted where the row with the largest value m in the ith column is pivoted
        %into the top row i
        U(i,:) = U(m,:);
        %The row i stored in x is now pivoted down to where the row m was
        U(m,:) = x; %This creates the new value for the U matrix
        
        %Same procedure is followed with the P matrix
        
        x = P(i,:); %Row i being pivoted is stored in x
        P(i,:) = P(m,:);%Row m with the largest value is pivoted to replace row i
        P(m,:) = x; %Row i stored in x is then stored over row m's previous location
        
        %Since [L] is a lower triangular matrix, there is no assigned value
        %in the first row, so the row i must be greater than or equal to 2
        if i >= 2
            %The [L] matrix follows the same pivoting procedure
            x =  L(i,:);  %Row i being pivoted is stored in x
            L(i,:) = L(m,:); %Row m with the largest value is pivoted to replace row i
            L(m,:) = x; %Row i stored in x is then stored over row m's previous location
        end
    end
    
    % For variable elimination and in assigning values for the [L] matrix
    % we start at the second row, so the loop begins at the (i+1)th column
    % and loops until the nth column
        for k = i+1:n
        % The [L] matrix is assigned the values that are used in the Gauss
        % elimination to create the [U] matrix
        L(k,i) = U(k,i)/U(i,i); %L(k,i) is the value used to elimnate certain variables from the [U] matrix
        %The [U] matrix is created by subtracting a row k by the row i above it
        %that has been multiplied by the value L(k,i). This elimnates some
        %of the variables and evetaully creates an upper triangular matrix
        U(k,:) = U(k,:)-L(k,i)*U(i,:); %Performing Gauss Elimination on the [U] matrix
        end
end
end