function magmat = magicmatrix(n,m)
% The magicmatrix function returns an n x m matrix in which the value of
% each element in the matrix is the sum of the value to the left and the
% vaule above the element
%Input:
% n = number of rows on the matrix
% m = number of columns on the matrix
%Output:
% magmat = The final n x m matrix with correct values
  
magmat = zeros(n,m); %To pre-establish matrix size

for i = 1:n %Establishes first row of values for n
    for j = 1:m %Establishes first column values for m
        if i == 1
           magmat(i,j) = j; %Creates a single row matrix
        elseif j == 1
            magmat(i,j) = i; %Creates a single column matrix
        else
            magmat(i,j) = (magmat(i-1,j) + magmat(i,j-1));
            %Creates the magic matrix adding the values from the left and
            %above the desired element for each element
        end
    end
end
end

