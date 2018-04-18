function [nd] = DaysofYear(month, day, leap)
% DaysofYear is a function that calculates the total number of days that
% have passed in the year when given the month, day and leap year input.
% Inputs:
% month = month of the year (entered as the integer value of the month.
%         i.e. January is entered as 1)
% day = day of the month entered as an integer between 1 and 31
% leap = signifies whether it is a leap year or not. Enter a one if it is a
%        leap year and a zero if it is not a leap year
% Outputs:
% nd = The number of days that have passed in the year from the date
%      inputed

imonths = month - 1; % imonths finds the month before the month input into the function
% The if function calculates the number of days that have passed in the
% previous months from the month input into the function
if imonths == 0
    idays = 0;
elseif imonths == 1 
    idays = 31;
elseif imonths == 2 
    idays = 59;
elseif imonths == 3 
    idays = 90;
elseif imonths == 4
    idays = 120;
elseif imonths == 5 
    idays = 151;
elseif imonths == 6 
    idays = 181;
elseif imonths == 7 
    idays = 212;
elseif imonths == 8
    idays = 243;
elseif imonths == 9 
    idays = 273;
elseif imonths == 10 
    idays = 304;
else
    idays = 334;
end
%This if loop calculates the total number of passed days in the year by
%adding the days of the selected month to the previous days while adding a
%day if it is a leap year
if leap == 0 
    nd = idays + day; %Calculates the total number of days that have passed
elseif leap == 1
    nd = idays + day + 1; %Adds one day for the leap year
else
    error('Incorrect Leap input read help for instructions')
end
fprintf('%d days in the year have passed\n',nd)
end
