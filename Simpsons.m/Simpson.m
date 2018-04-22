function [I] = Simpson(x,y)
%The function Simpson takes an input of x and y tabulated experimental data
%and the performs the Simpson's 1/3 Rule to find the integral (I) of the y data
%with respect to the x data. If there are an odd number of intervals in the data, the integral of 
%the last interval will be calculated using the trapezoidal rule rather 
%than Simpson's 1/3 rule. In order for the function to work, the x and y
%input vectors must be of the same length, and the values of the x vector
%must be equidistant apart.
% Inputs:
%   x - vector of tabulated experimental data (independent variable)
%   y - vector of tabulated experimental data (dependent variable)
% Outputs:
%   I - calculated value of the integral of the x and y vectors using the
%       Simpson's 1/3 rule (and Trapezoidal Rule if odd number of intervals)


%If statement ensures that x and y vectors are same length. Throws error if
%they are not the same distance
if length(x) ~= length(y)
    error('x and y are not vectors of the same length, read help for clarification')
end

I = 0; %Value of integral I is assigned initial value of 0
m = length(x); %m is value of the length of x which is also the length of y
x_dist = diff(x); %Calculates the distance between x intervals
n = length(x_dist); %n is value for length of x_dist vector

%For loop ensures every x vector value is equally spaced. Statement will throw an error if they are not equal. 
for i = 1:n
if x_dist(1) ~= x_dist(i)
    error('Values of x must be equidistant apart, read help for clarification')
end
end

num_int = length(x) - 1; %Determines the number of intervals on the x vector

%odd_even determines whether there are an odd or even number of intervals. If value 
%is not an integer then there are an odd number of intervals.
odd_even = num_int / 2;

%mod finds the remainder of odd_even divided by 1. If equal to zero there
%are an even number of intervals
if mod(odd_even,1) ~= 0 %For odd number of intervals
    warning('Trapezoidal rule was used for last interval due to an odd number of intervals')
    for k = 1:2:(m-2)
        %Performs Simpson's 1/3 Rule for the first even intervals
        I = (I + ((x(k+2)-x(k))*((y(k)+(4*y(k+1))+y(k+2))/6)));
    end
    %Performs the Trapezoidal Rule for the last odd interval
    I_trap = ((x(m)-x(m-1))*((y(m)+y(m-1))/2));
    %Total integral adds the Simpson's 1/3 and Trapezoidal Rules
    I = I + I_trap;
else %For even number of intervals
    for j = 1:2:(m-2)
        %Performs Simpson's 1/3 Rule for all values of x and y
        I = (I + ((x(j+2)-x(j))*((y(j)+(4*y(j+1))+y(j+2))/6)));
    end
end
end

