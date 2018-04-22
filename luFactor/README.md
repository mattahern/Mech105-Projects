# LU Factorization Algorithm

## Uses

The luFactor function in MatLab performs an LU factorization on a given matrix. This is done by performing Gaussian Elimination with pivoting. Pivoting ensures that there is no division by zero when performing the elimination. LU factorization is useful as it can be used to solve for the unknowns within a system of equations in which the input matrix is the coefficients in front of the unknowns in this system. Additionally, the LU Factorization can be used to determine the inverse of the input matrix. From the LU Factorization, it is found that [P][A] = [L][U].

## Inputs

A - The matrix in which LU factorization is to be performed. The values within the matrix often correspond to the coefficients of the unknown variables in a system of equations

## Outputs

L - the lower triangular matrix found using LU factorization

U - the upper triangular matrix found using LU factorization

P - the pivot matrix which is the original identity matrix of [A] pivoted along with the matrix [A] during LU factorization.

## Warnings

In order for the algorithm to work properly, the input matrix A must be a square matrix in which the number of columns is equal to number of rows otherwise LU factorization and pivoting will not be completed properly. If the matrix is not square, the function will throw an error.
