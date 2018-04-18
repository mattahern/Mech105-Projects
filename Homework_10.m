%% Homework 10 - February 23, 2018
% This section plots the function so that initial bracket guess can be made
% the find the root using false position
clear
clc

pt = 3; % Total Pressure of the Mixture (in atm)
K = 0.05; % Reaction's Equilibrium Constant
x = linspace(-10,10); % Defines a range for x
f = (x./(1-x)).*(((2*pt)./(2+x)).^(1/2))-K; % Function being evaluated

plot(x,f) % Plot Function to Guess Root Location
refline(0,0)
% When looking at the plot, it looks like there is a root between 0 and 0.5,
% so these will be used as brackets for the false position
%% This Section will calculate the root of the function
format long
syms x %Make x a symbolic variable
f = @(x) (x./(1-x)).*(((2*pt)./(2+x)).^(1/2))-K; %Function being evaluated
xl = 0; %Lower bracket set to 0
xu = 0.5; %Upper bracket set to 0.5
es = 0.01; %Desired Approximate error is set at 0.01%
ea = 100; %Relative Approximate error is assigned initial value of 100%

while ea > es 
    % Loops as a long as approximate error is greater than desired relative error
    root = (xu - ((f(xu)*(xl - xu))/(f(xl) - f(xu)))); % False Postion equation to find the root
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
fprintf('The root of the function is at x = ')
disp(root)
fprintf('This represents the mole fraction of dissociated H2O when the total pressure is 3 atm and the equilibrium constant is 0.05')
