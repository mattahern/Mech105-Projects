clear
clc

E = 1;
%E is the value for machine epsilon
while (1 + E) > 1
    %If 1 + E is greater than 1 then E is now equal to E/2.
    E = E / 2;
end
if (1 + E) <= 1
    %If 1 +e is less than or equal to one then the machine epsilon is E
    %times 2.
    E = 2 * E;
end
disp(E) %Displays value of machine epsilon