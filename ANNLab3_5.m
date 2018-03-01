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
p3 = p(1:3,:);             %contains the first three pattern
p4 = p(1:4,:);

%degraded and mixed data
p_deg = p(10,:);
p_mix = p(11,:);

%initialize weights
W3 = getWeightMatrix(p3);
W4 = getWeightMatrix(p4);

%% Recalling the function (for pattern storage checking)

n_pattern3 = size(p3,1);                    %number of patterns
matrix_size3 = size(p3);
%check if learning was succesfull
out_p_learn3 = rand_recall(p3,n_pattern3,matrix_size3,W3);

%check for equality of input and output of recall
%for learning
fprintf('For the learning function:\n')
equality(p3,out_p_learn3);


% P4
n_pattern4 = size(p4,1);                    %number of patterns
matrix_size4 = size(p4);
%check if learning was succesfull
out_p_learn4 = recall(p4,n_pattern4,matrix_size4,W4);

%check for equality of input and output of recall
%for learning
fprintf('For the learning function:\n')
equality(p4,out_p_learn4);

%% Plot the pictures for check of stability

create_pic(out_p_learn3(1,:));  %picture number p1 as output (saved pattern)
create_pic(out_p_learn3(2,:));  %picture number p2 as output (saved pattern)
create_pic(out_p_learn3(3,:));  %picture number p3 as output (saved pattern)

create_pic(out_p_learn4(1,:));  %picture number p1 as output (saved pattern)
create_pic(out_p_learn4(2,:));  %picture number p2 as output (saved pattern)
create_pic(out_p_learn4(3,:));  %picture number p3 as output (saved pattern)
create_pic(out_p_learn4(4,:));  %picture number p4 as output (saved pattern)