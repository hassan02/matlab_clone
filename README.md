# matlab_clone
MatLabClone v0.1.0




Functionalities:
Array creation
a = 1 2 3 4 create an array of a = [1 2 3 4]

Matrix creation
a = [1 3 5;2 4 6;3 5 7] - should create a matrix as below
    1 3 5
    2 4 6
    3 5 7
    
Zero vector matrix creation
z = zeros(5, 2) - should create a 5-by-1 vector of zeros as shown
    0 0 0 0 0
    0 0 0 0 0

Matrix and Array Operations:
Addition of matrix and a number
1 2 3         11  12  13
4 5 6 + 10 =  14  15  16
7 8 9         17  18  19

Transposing a matrix
              1 2 3       1 4 7
transpose of  4 5 6   =   2 5 8
              7 8 9       3 6 9

Inverse of a matrix
Programs finds inverse of a matix

Concatenation
Programs joins a matrix and output the result
Horizontal concatenation
[[1 2 3],[3 4 5];[4 5 6],[7 8 9]] = 1 2 3 4 5 6
							                      4 5 6 7 8 9

Vertical concatenation
[[1 2 3],[3 4 5],[4 5 6],[7 8 9]] = 1 2 3
							                      3 4 5
							                      4 5 6
							                      7 8 9

Save the working area
User can save using the command 'save > filename.mat'

Load into the working area
User can load saved data using the command 'load filename.mat'

How to use:

   Download zipped repository from https://github.com/Hassan02/matlab_clone
   Extract file to a folder.
   Run command prompt and navigate to the folder
   Enter ruby matlabclone_cli.rb into the command prompt to run the application.
   
Developed by Hassan Oyeboade as Andela Fellow Class XIII bootcamp project.
