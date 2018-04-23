function [I] = Simpson(x,y)
%Simpson function
%This function integrates experimental data by using the Simpson's 1/3
%Rule. If there are an odd number of intervals, however, then the
%trapezoidal rule is used on the last interval. It does so by taking the (x) and (y)
%inputs and integrating this data 
%   Inputs:
%       x - data
%       y - data
%   Outputs:
%       I - Integration numerical data
%Function was created on 04/05/18 by Jason Sayre
%Last edit was on 04/05/18 by Jason Sayre


%% For testing purposes only, comment out if using on other data
%[x] =  [10; 14; 18; 22; 26; 30; 34; 38; 42; 46;];
%[x] = [140; 141; 142; 143; 144; 145; 146; 147; 148; 149; 150];
%[y] = [15.72; 15.53; 15.19; 16.56; 16.21; 17.39; 17.36; 17.42;17.60;17.75; 17.82];
%[x] = [140; 141; 142; 143; 144; 145; 146; 147; 148; 149];
%[y] = [15.72; 15.53; 15.19; 16.56; 16.21; 17.39; 17.36; 17.42;17.60;17.75]; %code gets 150.4883 ,actual is 149.9950
%[z] = [15.49; 16.16; 15.35; 15.13; 14.20; 14.23; 14.29; 14.74; 14.74; 13.68]; %code gets 133.8600 , actual is 133.4250
%% Error Checks

if nargin < 2
    error('You must enter 2 input arguments ')
end

if nargin > 2
    error('Too many input arguments, try again ')
end

if nargout ~= 1
    error('Too many output arguments requested, try again ')
end


lthX = length(x); %determines length of data matrix x
lthY = length(y); %determines length of data matrix y
if lthX ~= lthY; %checks if the 2 data matrices are identicle in length
    error('the 2 input variables must match in length')
end

difX = diff(x); %calculates difference among every x value and stores is difX matrix
difXlength = length(difX);
for i=1:difXlength; %loops 1 less time than the length of matrix x
    if difX(1)~= difX(i) %compares first difX matrix value to every other value to make sure they match
        error('the x matrix must be in equally spaced intervals') %returns error if not in equally spaced intervals
    end
end

rem = mod(lthX,2); %checks if the length of x is even divisible by 2 and will store remainder in variable rem
if rem == 0 %if length of x matrix is even, lets user know that the trapezoid rule will be used for last segment
    warning('The trapezoidal rule will be used for the last segment')
end
%% Executing Integration

if rem == 0  %indicates trapezoid rule must be used for last segment
    %below 5 lines conduct trapezoid rule on last segment
    traplast = lthX; %last element
    trapfirst = lthX - 1; %2nd to last element
    trapwidth = x(traplast) - x(trapfirst); %determines width of 2 x values
    trapheight = ( y(traplast)+y(trapfirst))/2; %determines average height
    trapsegment = (trapwidth*trapheight) %integrates last segment by multiplying average height and width
    
    %below lines conduct Simpson 1/3 rule on all but last segment
    one3last = trapfirst %redifines first segment of trap rule as last of 1/3 rule
    one3lastminus1 = (one3last -1); %to save last 1/3 rule x value for use in integration fomula
    one3first = 1 %defines 1st element as 1
    storeyOdd = sum(y(3:2:one3lastminus1)); %sums all even y values excluding 1st and last to properly reference in taking the Integral using 1/3 rule
    storeyEven = sum(y(2:2:one3lastminus1)); %sums all odd y values excluding 1st and last to properly reference in taking the Integral using 1/3 rule
    
    one3width = difX(1);
    %one3width = (x(one3last) - x(one3first)) %determines width of x in what is being evaluated with 1/3 rule
    one3height = ((y(one3first) + (4*storeyEven) + (2*storeyOdd)+ y(one3last))/3); %determines heights of each segment
    one3segment = (one3width*one3height) %integrates 1/3 segment by multiplying one3width by one3height

    I = (trapsegment + one3segment) %adds trapezoid segment to 1/3 Simpsons rule segment
disp('Both trapezoid rule and 1/3 Simpsons rule were executed')


else %We run only 1/3 rule on all data
    one3last = lthX;
    one3lastminus1 = (one3last -1);
    one3first = 1;
    storeyOdd = sum(y(3:2:one3lastminus1)); %sums all even y values excluding 1st and last to properly reference in taking the Integral using 1/3 rule
    storeyEven = sum(y(2:2:one3lastminus1)); %sums all odd y values excluding 1st and last to properly reference in taking the Integral using 1/3 rule
    
    %one3width = difX(1)
    one3width = (x(one3last) - x(one3first)); %determines width of x in what is being evaluated with 1/3 rule
    one3heightnumerator = ((y(one3first) + (4*storeyEven) + (2*storeyOdd)+ y(one3last))); %determines heights of each segment
    one3heightdenominator = (3 * (one3last-1));
    one3height = (one3heightnumerator/one3heightdenominator);
    one3segment = (one3width*one3height) %integrates 1/3 segment by multiplying one3width by one3height

    I = one3segment
disp('Only 1/3 Simpsons rule was executed') 

end
end
