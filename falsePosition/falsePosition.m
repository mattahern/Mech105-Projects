function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%The function falsePosition creates a False Position Algorithm to estimate
%the root of a given function. The function takes five input values and 
%solves for four output variables. If an error occurs with unidentified 
%variable 'x' remember to first make it a symbolic variable using 'syms x' 
% Inputs:
% func - the function being evaluated (Use variable x)
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error (defaults to 0.0001%)
% maxiter - the number of iterations desired (defaults to 200)
% Outputs:
% root - the estimated root location
% fx - the function evaluated at the root location
% ea - the approximate relative error (given as percentage)
% iter - how many interations were performed

format long
syms x % Sets x as a symbolic variable
f(x) = func; % Sets input func as a function of x

% Following if statement evaluates for number of input argumenrts
if nargin < 3 %If less than three inputs are given an error displays
    error('A minimum of three inputs for func, x1, and xu are required. Read help for clarification.')
elseif nargin < 4 %If less four inputs are given
    es = 0.0001; %es is given default value of 0.0001
    maxiter = 200; %maxiter is given default value of 200
elseif nargin < 5 %If less than five inputs are given
    maxiter = 200; %maxiter is given default value of 200
end

%signcheck = sign(func(xl) * func(xu); % Multiplies f(x) at values of brackets 
if sign(f(xu)) == sign(f(xl)) %If the product is not negative it means there is no sign change and therefore no root between brackets
    error('There is no sign change between brackets, try new values for x1 and xu')
end

iter = 0; % Before any calculations are made the number of iterations is 0
ea = 100; % Function set to begin with a 100% error

while ea > es && iter < maxiter 
    % Loops as a long as approximate error is greater than desired relative error or 
    %the number of iterations is less than the maximum allowed iteratios
    root = (xu - ((f(xu)*(xl - xu))/(f(xl) - f(xu)))); % False Postion equation to find the root
    iter = iter + 1; %Increases the iteration by one for each loop
    if (f(root)*f(xl)) < 0 && f(root) > f(xl) % Determines whether new root is upper or lower bracket for new approximation
        ea = abs((root - xu)/root)*100; % Calculation for the approximate relative error
        xu = root; % Calculated root value becomes new upper bound for next iteration
    elseif (f(root)*f(xl)) < 0 && f(root) < f(xl) % Determines whether new root is upper or lower bracket for new approximation
        ea = abs((root - xl)/root)*100; % Calculation for the approximate relative error
        xu = xl; % Old lower bound becomes upper bound for new iteration
        xl = root; % Calculated root value becomes new lower bound for next iteration
    elseif (f(root)*f(xu)) < 0 && f(root) < f(xu) % Determines whether new root is upper or lower bracket for new approximation
        ea = abs((root - xl)/root)*100; % Calculation for the approximate relative error
        xl = root; %Calculated root value becomes the new lower bound for next iteration
    else
        ea = abs((root - xu)/root)*100; % Calculation for the approximate relative error
        xl = xu; % Old upper bound becomes lower bound for new iteration
        xu = root; % Calculated root value becomes the new upper bound for next iteration
    end
end
fx = func; % Sets the function equal to fx
disp(fx) %Displays output function fx
fprintf('Number of iterations')
disp(iter) % Displays the number of iterations
fprintf('Approximate relative error percentage is:')
double(ea) % Displays the final approximate error as a percentage. (double converts value from fraction to decimal)
fprintf('Final evaluations for the root:')
double(root) % Displays the final evaluation of the root. (double converts value form fraction to decimal)
fprintf('This is also the value for the root approximation shown as a fraction')
end


