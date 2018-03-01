clear all; close all; clc;
%Lab 3 Part 1

%Hoppfield Networks

%% Create data

data = load('pict.dat');
p = zeros(length(data)/1024,1024);
%convert data into different patterns per line
for n = 1:length(data)/1024
    p(n,:) = data(n*1024 - 1023:n*1024);
end
%learning data is only the first three patterns
p_learn = p(1:3,:);             %contains the first three pattern

%degraded and mixed data
p_deg = p(10,:);
p_mix = p(11,:);

%initialize weights
W = zeros(size(p_learn,2),size(p_learn,2));

%% Hebbian learning

% Calculate weight matrix for learning
for i = 1:size(p,2)
    for j = 1:size(p,2)
        weight = 0;
        if i ~= j                                %make diagonal zero
            for n = 1:size(p_learn,1)            %number of input patterns (mu)
                weight = p_learn(n,i) .* p_learn(n,j) + weight;
            end
        end
        W(i,j) = weight;
    end
end

%check that weights are symmetric
if issymmetric(W)
    fprintf('Weights are symmetric. \n\n')
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

%Calculate the energy of each of the attractors
E_p1 = energy(p_learn(1,:),W);
E_p2 = energy(p_learn(2,:),W);
E_p3 = energy(p_learn(3,:),W);

%% Plot the pictures for check of stability

%create_pic(p_learn(1,:));      %picture number p1 input
%create_pic(out_p_learn(1,:));  %picture number p1 as output (saved pattern)
%create_pic(out_p_learn(2,:));  %picture number p2 as output (saved pattern)
%create_pic(out_p_learn(3,:));  %picture number p3 as output (saved pattern)

%% Degraded data
%Look if it is working with the degraded data
n_pattern = size(p_deg,1);                    %number of patterns
matrix_size = size(p_deg);

%use the atractors in the weights to get right output
[out_deg,E_deg] = recall(p_deg,n_pattern,matrix_size,W);

%use random units and the original sequential hopfield dynamics
[rout_deg,E_rdeg] = rand_recall(p_deg,n_pattern,matrix_size,W);


%calculate energy after recalling and compare
%E_deg = energy(p_deg,W);

%% Mixed Type data
%Look if it is working with the degraded data
n_pattern = size(p_mix,1);                    %number of patterns
matrix_size = size(p_mix);

%first loop uses input, then it reuses the output from before
i = 1; %works already after 1. cycle
out_mix(:,:,i) = recall(p_mix,n_pattern,matrix_size,W);

%create a loop for finding a number of update functions to get better
%results
numb_err = [1,1];
while (numb_err(i,1) > 0) && (numb_err(i,2) > 0) && (i <= 2000)
    i = i+1
    %use random units and the original sequential hopfield dynamics
    rout_mix(:,:,i) = rand_recall(p_mix,n_pattern,matrix_size,W);
    
    numb_err(i,1) = equality(p_learn(2,:),rout_mix(:,:,i));
    numb_err(i,2) = equality(p_learn(3,:),rout_mix(:,:,i));

end
