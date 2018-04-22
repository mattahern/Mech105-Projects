# Simpson's Algorithm

## Uses

The Simpson.m function in MatLab takes an input of x and y tabulated experimental data
and the performs the Simpson's 1/3 Rule to find the integral (I) of the y data
with respect to the x data. Useful for performing numerical integration when given a 
table of values and/or when the integral of a function is too difficult to compute.

## Inputs

x - vector of tabulated experimental data (independent variable)

y - vector of tabulated experimental data (dependent variable)

## Outputs

I - calculated value of the integral of the x and y vectors using the Simpson's 1/3 rule

## Warnings

In order for the function to work properly, the x and y input vectors must be the same length otherwise the function will throw an error.
Additionally, an error will occur if the values of the x vector are not equidistant apart. Finally, the Simpon's 1/3 rule works by 
performing numerical integration over an even number of intervals. If the input vectors have an odd number of intervals, the function will
perform numerical integration using the trapezoidal rule over the last interval and warn the user of this.
