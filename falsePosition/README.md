# False Position Algorithm

## Uses

The falsePosition.m function in MatLab estimates the root of a given input function. The root of a function occurs when the derivative of the function equals zero. This algorithm is useful for performing numerical differentiation for calculating the root of a function in which it is too difficult and/or time consuming to calculate the derivative by hand.

## Inputs

func - the function being evaluated (use variable x)
xl - the lower guess of the root
xu - the upper guess of the root
es - the desired relative error of the estimate. The algorithm will default the value to 0.0001% if no value given
maxiter - the number of iterations desired of the false position function. The algorithm defaults to 200 iterations if no value is given

## Outputs

root - the estimated root location of the function between xl and xu
fx - The function that was evaluated for its root location
ea - the approximate relative error between the root estimate and the actual value (given as percentage)
iter – The number of interations that were performed to estimate the root to the desired relative error, or until maxiter reached.

## Warnings

In order for the algorithm to work properly, the input function (func) must be a function of x. To do this make sure that you have identified x as a symbolic variable before starting the algorithm. This can be done using **_syms x_** before **_f = ‘function of x’_** or **_f  = @x ‘function of x’_** in MatLab.
