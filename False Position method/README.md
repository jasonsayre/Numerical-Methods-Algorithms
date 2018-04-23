# False Position Method
## This function estimates the root of a given function by iterating the false position method to a certain error percentage
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
##### Program created by Jason Sayre on 02/17/18
##### Last edit on 01/17/18
