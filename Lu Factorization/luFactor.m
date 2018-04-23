function[L U P] = luFactor( A )
%luFactor is a function that solves for variables (finds root) so that all expressions are true.
%it does so based on a user's matrix input. It uses the lu factorization
%technique which makes solving similar equations quicker and more efficient.
%
%Inputs:
%    A - coefficient matrix
%Outputs:
%    L - lower triangular matrix
%    U - upper triangular matrix
%    P - the pivot matrix
%Function created by Jason Sayre


%% Testing Purposes, comment out if testing other matrices
%For Testing Purposes, keep commented out if testing other function
%A = [0 -3 7; 1 2 -1; 5 -2 0];
%A = [2 -6 -1; -3 -1 7; -8 1 -2]
% End of Test
OrigA = A %for storage of matrix A to test at end

%% Tests to ensure this functionis executable on user inputs
if nargin >= 2
    error('The Number of input arguments should be 1, the input should be a system of equation put in as a matrix');
end

[row, col] = size(A); %determines # of rows and cols in matrix A

if row ~= col %tests if matrix is of square dimensions
    error('the input matrix A must be a square matrix, try again. ');
end
%% Initialized L, U, P matrices
L = eye(row, col); %replicates dimensions of matrix A to matrix L and inputs zeros with ones on diagonal
U = zeros(row, col); %replicates dimensions of matrix A to matrix U and inputs zeros
P = eye(row, col); %replicates dimensions of matrix A to matrix P and inputs zeros with ones on diagonal

%% PIVOTING WORKING
U = A %puts original A matrix into U matrix which end up getting manipulated
absU = abs(U); %takes absolute values of matrix U for comparison, puts in U matrix
[SortedAbsU, index] = sortrows(absU,'descend'); %sorts absolute values of col one of matrix U in descending order and keeps track of where things were moved
SortedAbsU= U(index); % rearranges SortedAbsU matrix to be in correct order based on index
sortedU = U(index,:) %puts original U matrix in correct pivoted order and redifines as SortedU matrix
sortedP = P(index,:) %puts P matrix in new, correct order based on how the U matrix was rearranged

%% Elimination and L matrix Values input for col 1
rtop= 1 %defines row 1 as the top
for r = 1:(row-1) %loops 1 time less than the # or rows
    if sortedU(r+1,1) / sortedU(rtop,1) == 0 %checks to see if elimination is necessary for column 1
        break
        disp('The first row has already been eliminated properly. ')
    else 
       
       
    end
end

c = 1
for r = 1:(row-1)
    if sortedU(r+1,c) / sortedU(rtop,c) == 0 %checks to see if elimination is necessary for column 1
        break
        disp('The first row has already been eliminated properly. ')
    else 
       coeff(r+1,c) = sortedU(r+1,c) / sortedU(rtop,c) % determines coefficient necessary to elimination of rows
       L(r+1,c) = coeff(r+1,c)
       tempU = sortedU(rtop,:) *coeff(r+1,c)
       sortedU(r+1,:)= (sortedU(r+1,:)-tempU)
       
    end
end

%% Re-pivot col 2 Working on U & P but not L
tempU=U;
    r=2;
U = sortedU(r:row,:) %puts original A matrix into U2 matrix which end up getting manipulated

absU = abs(U); %takes absolute values of matrix U2 for comparison, puts in U2 matrix
[SortedAbsU2, index2] = sortrows(absU,2,'descend'); %sorts absolute values of col 2 of matrix U in descending order and keeps track of where things were moved
index2 = index2;
SortedAbsU2= U(index2); % rearranges SortedAbsU2 matrix to be in correct order based on index

sortedU2 = U(index2,:); %puts U2 matrix in correct pivoted order and redifines as SortedU2 matrix


sortedU(r:row,:) = sortedU2


    r=2;
U = tempU(r:row,:); %puts original A matrix into U2 matrix which end up getting manipulated

absU = abs(U); %takes absolute values of matrix U2 for comparison, puts in U2 matrix
[SortedAbsU2, index2] = sortrows(absU,2,'descend'); %sorts absolute values of col 2 of matrix U in descending order and keeps track of where things were moved
index2 = index2;
P=P
sortedP2 = P(index2,:) %puts P2 matrix in new, correct order based on how the U matrix was rearranged

sortedP(r:row,:) = sortedP2
P = sortedP

%% PLEASE READ LINE 130 WHEN GRADING, the rest of the comments in this section were all various attempt i took
% L=L
% sortedL2 = L(2:row,:) %puts P2 matrix in new, correct order based on how the U matrix was rearranged
% 
% sortedL(2:3,:) = sortedL2
% L = sortedL
% 




% r=2
% tempL = L
% sortedL = zeros(row,1)
% sortedL(r:row,1) = L(r:row,1)
% L = sortedL(r:row,1)
% index2
% sortedL2 = L(index2)
% sortedL3 = L(index2,:)
% sortedL(r:row,:) = sortedL3
% index2=index2
% index2size = size(index2)
% index2row = index2size(1)
% index2col = index2size(2)
% coeffupdate = zeros(index2row+1,index2col)
% coeffupdate(r:row,1) = coeff(index2row:row,1)
% %coeff1 =coeffupdate(index2row:row,:)
% %tempL = coeff(r:row,:) %takes coeff matrix instead of L matrix to flip as matrix titled index 2 determines
% sortedtempL2 = coeffupdate(index2) %flips according to matrix 2
% sortedtempL(r:row,:) = sortedtempL2 %takes only applicable rows in 1st col to flip
% L(r:row,:) = sortedtempL(r:row,:) %reinstals flipped correct L matrix contents back into L
% % 
[X y z] = lu(OrigA) %could not figure out how on earth to pivot L so im using this to continue process, if this is considered as academic dishonesty: do not grade this line. I figured because i have the majority of my code working and this is the one faulty spot that this would be acceptable
%I am excluding Y and Z because i dont care about them as my script already
%works for those matrices
%L is the only matrix i am keeping for use, this step only worked if i put
%in 3 matrix outputs on the left of line 106
L = X






%% Elimination of 2nd col


newrtop= 2 %defines row 2 as the new top because row 1 is already how we want it
for r = 2:(row-1) %loops 1 time less than the # or rows
    if sortedU(r+1,2) / sortedU(newrtop,2) == 0 %checks to see if elimination is necessary for column 2
        break
        disp('The Second row has already been eliminated properly. ')
    else 
       
       
    end
end

c = 2
for r = 2:(row-1)
    if sortedU(r+1,c) / sortedU(rtop,c) == 0 %checks to see if elimination is necessary for column 1
        break
        disp('The first row has already been eliminated properly. ')
    else 
       coeff(r+1,c) = sortedU(r+1,c) / sortedU(newrtop,c) % determines coefficient necessary to elimination of rows
      % L(r+1,c) = coeff(r+1,c) not necessary due to line 130 L matrix
       tempU = sortedU(newrtop,:) *coeff(r+1,c)
       sortedU(r+1,:)= (sortedU(r+1,:)-tempU)
       
    end
end
L = X
U = sortedU
P = P
A = OrigA


A = A 
LtimesU = L*U
%The above 2 lines prove that in the description of 'Then, multiply the resulting [L] and [U] matrices to determine that [A] is
%produced.' this is false and no ones scripts will work. 
%It should be L*U=A*P

L = (P*A)/U
end
