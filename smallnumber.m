clear
clc
m = 2^0; %m is the smallest possible value of the mantissa
e = ((2^0)-1023); %e is teh largest posssible negative exponent

smallnum = m*(2^e);
%Computers display numbers as the mantissa times two to the power of the
%exponent.

display(smallnum)
%displays the smallest possible number a computer can display
