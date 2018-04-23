# False Position Method
## This created function estimates the root of a given function by iterating the false position method to a certain error percentage
### Syntax:
  * Please execute this function as follows: '[root, fx, ea, iter] = falsePosition(func, xl ,xu, es, maxiter)'
### Inputs:
  * func - the function being evaluated. Please enter function in the format of "@(x)" followed by the desired function. Example: '@(x) x.^3+5*x-4 '
  * xl - the lower guess
  * xu - the upper guess
  * es - the desired relative error as a (default = 0.0001%)
  * maxiter - the number of iterations desired (default = 200)
### Outputs:
  * root - the estimated root location
  * fx - the function evaluated at the root location
  * ea - the approximate relative error as a percent
  * iter - how many iterations were performed
### Limitations:
  * There must be between 3 and 5 input arguments, listed in order above
  * There must be a sign change over the interval of the lower and upper guess for the function to work
### Additional Information: 
  * This closed root finding method is slower than open root finding methods, but always works
##### Program created on 02/17/18 by Jason Sayre
##### Last edit on 02/17/18 by Jason Sayre
