clear all; close all; clc;
%Lab 3 Part 1

%Hoppfield Networks

%% Create data

%memory patterns in binary style (for learning)
x1 = [-1 -1  1 -1  1 -1 -1  1];
x2 = [-1 -1 -1 -1 -1  1 -1 -1];
x3 = [-1  1  1 -1 -1  1 -1  1];

input = [x1; x2; x3];

%patterns for 3.1 (distorted input patterns)
x1d = [1 -1 1 -1 1 -1 -1 1];
x2d = [1 1 1 1 -1 1 -1 -1];
x3d = [1 -1 -1 1 1 -1 1 -1];

inputd = [x1d; x2d; x3d];

%initialize weights
W = zeros(size(x1,2),size(x1,2));
%W = zeros(size(input,1),size(input,2));             %fixed for 3D data already

%% Hebbian learning

% Calculate weight matrix for learning
for i = 1:size(x1,2)%*size(x,1)                   %fixed for 3D data already
    for j = 1:size(x1,2)
        weight = 0;
        %if i ~= j                                %If this is taken away, a good solution is found
            for n = 1:size(input,1)
                weight = input(n,i) .* input(n,j) + weight;
            end
        %end
        W(i,j) = weight;
    end
end


%% Recalling the function (for pattern storage checking)

n_pattern = size(input,1);                    %number of patterns
matrix_size = size(x1);
%check if learning was succesfull
output = recall(input,n_pattern,matrix_size,W);

%check for equality of input and output of recall
%for learning
fprintf('For the learning function:\n')
equality(input,output);


%Look if it is working with the distorted data
n_pattern = size(inputd,1);                    %number of patterns
matrix_size = size(x1d);
%first loop uses input, then it reuses the output from before
i = 1;
outputd(:,:,i) = recall(inputd,n_pattern,matrix_size,W);
fprintf('\nFor the distorted patterns (1. cycle):\n')
equality(input,outputd);

%create a loop for finding a number of update functions to get better
%results
numb_err = 1;
while (numb_err > 0) && (i <= 2000)
    i = i+1;
    outputd(:,:,i) = recall(outputd(:,:,i-1),n_pattern,matrix_size,W);
    fprintf('\nFor the distorted patterns (%d. cycle):\n',i)
    numb_err = equality(input,outputd(:,:,i));
end
