clear all; close all; clc;
%ANN Lab 3 part 4

%Start by creating the data
data = load('pict.dat');
p = zeros(length(data)/1024,1024);
for n = 1:length(data)/1024
    p(n,:) = data(n*1024 - 1023:n*1024);
end
%learning data is only the first three patterns
p_learn = p(1:3,:);             %contains the first three pattern

%initialize weights
W = zeros(size(p_learn,2),size(p_learn,2));

%% Perform hebian learning for p1, p2 and p3

% Calculate weight matrix for learning
for i = 1:size(p,2)%*size(x,1)                   %fixed for 3D data already
    for j = 1:size(p,2)
        weight = 0;
        %if i ~= j                                %If this is taken away, a good solution is found
            for n = 1:size(p_learn,1)
                weight = p_learn(n,i) .* p_learn(n,j) + weight;
            end
       % end
        W(i,j) = weight;
    end
end

%% Recalling the function (for pattern storage checking)

n_pattern = size(p_learn,1);                    %number of patterns
matrix_size = size(p_learn);
%check if learning was succesfull by having the p_learn as input
out_p_learn = recall(p_learn,n_pattern,matrix_size,W);

%check for equality of input and output of recall
%for learning
fprintf('For the learning function:\n')
equality(p_learn,out_p_learn);

%% Plot to check if it the same
%create_pic(out_p_learn(1,:));  %picture number p1 as output (saved pattern)

%% create randomly noisy data



%Use the function p3_4_CreateNoise to create 10 vectors with noise ranging
%from 10% to 100%.
p1_noise = p3_4_CreateNoise(p_learn(1,:));
p2_noise = p3_4_CreateNoise(p_learn(2,:));
p3_noise = p3_4_CreateNoise(p_learn(3,:));

%evaluate the new data

% i=1;
% n_pattern = size(output(1,:),1);                    %number of patterns
% matrix_size = size(output(1,:));
% out_mix(:,:,i) = recall(output(6,:),n_pattern,matrix_size,W);
% 
% equality(p_learn(1,:),out_mix);

%Use the function p3_4_CheckNoise to use the noisy data as input and return
%the output and the error of how many values were wrong for each

%one iteration
[p1_noise_output, p1_error] = p3_4_CheckNoise(p1_noise,p_learn(1,:), W);
[p2_noise_output, p2_error] = p3_4_CheckNoise(p2_noise,p_learn(2,:), W);
[p3_noise_output, p3_error] = p3_4_CheckNoise(p3_noise,p_learn(3,:), W);

p1_noise_output_new = p1_noise_output;
p2_noise_output_new = p2_noise_output;
p3_noise_output_new = p3_noise_output;

%many iterations:
for i = 1:2
[p1_noise_output_new, p1_error_new] = p3_4_CheckNoise(p1_noise_output_new, p_learn(1,:),W);
[p2_noise_output_new, p2_error_new] = p3_4_CheckNoise(p2_noise_output_new,p_learn(2,:), W);
[p3_noise_output_new, p3_error_new] = p3_4_CheckNoise(p3_noise_output_new,p_learn(3,:), W);
end

%Create a subplot(2,5,1) with all the outputs for p1, p2 and p3 with noises
p3_4_create_subplot(p1_noise_output_new);
p3_4_create_subplot(p2_noise_output_new);
p3_4_create_subplot(p3_noise_output_new);