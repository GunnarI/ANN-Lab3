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
        if i ~= j                                %If this is taken away, a good solution is found
            for n = 1:size(p_learn,1)
                weight = p_learn(n,i) .* p_learn(n,j) + weight;
            end
        end
        W(i,j) = weight;
    end
end

%% Recalling the function (for pattern storage checking)

n_pattern = size(p_learn,1);                    %number of patterns
matrix_size = size(p_learn);
%check if learning was succesfull
out_p_learn = recall(p_learn,n_pattern,matrix_size,W);

%check for equality of input and output of recall
%for learning
fprintf('For the learning function:\n')
equality(p_learn,out_p_learn);

%% Plot to check if it the same
create_pic(out_p_learn(1,:));  %picture number p1 as output (saved pattern)

%% create randomly noisy data
%want to create 10 different noisy data for p1, from 0% to 100% jumping on
%10% = 11 different vectors.

% For 10%: I first need to find how many 10% units are,
ten_perc_nr = round(0.1 * length(p_learn(1,:)));

% To flip them I can multiply specific values by -1.

%pull 102 random numbers from 1:1024
p_length_int = 1:length(p_learn);
random_int = randsample(p_length_int,ten_perc_nr);

%initialize the new noisy vector
p1_10perc_noise = p_learn(1,:);

%Change the randomly selected data
for i = 1:ten_perc_nr
    p1_10perc_noise(random_int(i)) = p1_10perc_noise(random_int(i))*-1;
end

%evaluate the new data
i=1;
n_pattern = size(p1_10perc_noise,1);                    %number of patterns
matrix_size = size(p1_10perc_noise);
out_mix(:,:,i) = recall(p1_10perc_noise,n_pattern,matrix_size,W);

equality(p_learn(1,:),out_mix);
%Got patterns are stored and right so it is ok for 10perc.

    
