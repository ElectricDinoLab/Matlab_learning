% devi's training: module 1
% how to put variables into a file & save it & other fun stuff

% create the variables

variable1 = rand(10);
variable2 = rand(10);

% reshape into vectors
vectorvar1 = reshape(variable1, 1, []);
vectorvar2 = reshape(variable2, 1, []);

% visualize what was just created

plot(vectorvar1, vectorvar2)

% output to an excel file & save it
filename = 'vectorvar1.csv';
filename2 = 'vectorvar2.csv';
csvwrite(filename, vectorvar1);
csvwrite(filename2, vectorvar2);

% clear your workspace & then read the files you just made back in
clear

vectorvar1 = csvread('vectorvar1.csv');
vectorvar2 = csvread('vectorvar2.csv');

% reshape vectors into matrices

matrixvar1 = reshape(vectorvar1, [], 10);
matrixvar2 = reshape(vectorvar2, [], 10);

% visualize matrices
imagesc(matrixvar1);colorbar
imagesc(matrixvar2);colorbar

% plot is for one-dimensional data, whereas imagesc is for two-dimensional data

% let's make another matrix with ones & zeros
% the goal is to make a 20x20 array, where the first row contains 19 ones & the
% last cell in that row is a zero. The first column is all ones, the last row is
% all ones, and the first upper-left cell to the last bottom-right cell is
% diagonally filled with ones.
% make sure to look at each variable after each step so you see how it
% changes

% starting with just making one row with 20 columns of "1"s
a = ones(1,20);

% now we make a 20x20 array that is diagonally filled with ones
M = diag(a);
% next we fill the top 19 columns with ones & the last one a zero
M(1,:) = [ones(1,19) 0];
% now we fill the first column with ones by using the original "a" variable
M(:,1)=a';
% and finally we make the very bottom row filled with ones
M(20,:) = a;
