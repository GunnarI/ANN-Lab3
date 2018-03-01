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
noisyPerc = 5;
numNoisy = round((noisyPerc/100)*size(p,2));
p_noisy = addNoise(p,numNoisy);

%learning data is only the first three patterns
% p3 = p(1:3,:);             %contains the first three pattern
% p3_noisy = p_noisy(1:3,:);
% p4 = p(1:4,:);
% p4_noisy = p_noisy(1:4,:);
% p5 = p(1:5,:);
% p5_noisy = p_noisy(1:5,:);
% p6 = p(1:6,:);
% p6_noisy = p_noisy(1:6,:);
% p7 = p(1:7,:);
% p7_noisy = p_noisy(1:7,:);

[out_p3, W3] = getPOut(p,3,p_noisy);
[out_p4, W4] = getPOut(p,4,p_noisy);

err_p3 = equality3_5(p(1:3,:),out_p3);
err_p4 = equality3_5(p(1:4,:),out_p4);

%initialize weights
% W3 = getWeightMatrix(p3);
% W4 = getWeightMatrix(p4);
% W5 = getWeightMatrix(p5);
% W6 = getWeightMatrix(p6);
% W7 = getWeightMatrix(p7);

%% Recalling the function (for pattern storage checking)

% n_pattern3 = size(p3,1);                    %number of patterns
% matrix_size3 = size(p3);
% %check if learning was succesfull
% out_p3 = rand_recall3_5(p3,n_pattern3,matrix_size3,W3);
% 
% %check for equality of input and output of recall
% %for learning
% fprintf('For the learning function:\n')
% equality(p3,out_p3);


%% P4
% n_pattern4 = size(p4,1);                    %number of patterns
% matrix_size4 = size(p4);
% %check if learning was succesfull
% out_p4 = rand_recall3_5(p4,n_pattern4,matrix_size4,W4);
% 
% for i = 1:5
%     out_p4 = rand_recall3_5(out_p4,n_pattern4,matrix_size4,W4);
% end
% 
% %check for equality of input and output of recall
% %for learning
% fprintf('For the learning function:\n')
% equality(p4,out_p4);
% 
% %% P5
% n_pattern5 = size(p5,1);                    %number of patterns
% matrix_size5 = size(p5);
% %check if learning was succesfull
% out_p5 = rand_recall3_5(p5,n_pattern5,matrix_size5,W5);
% 
% for i = 1:10
%     out_p5 = rand_recall3_5(out_p5,n_pattern5,matrix_size5,W5);
% end
% 
% %check for equality of input and output of recall
% %for learning
% fprintf('For the learning function:\n')
% equality(p5,out_p5);
% 
% %% P6
% n_pattern6 = size(p6,1);                    %number of patterns
% matrix_size6 = size(p6);
% %check if learning was succesfull
% out_p6 = rand_recall3_5(p6,n_pattern6,matrix_size6,W6);
% 
% for i = 1:1
%     out_p6 = rand_recall3_5(out_p6,n_pattern6,matrix_size6,W6);
% end
% 
% %check for equality of input and output of recall
% %for learning
% fprintf('For the learning function P6:\n')
% equality(p6,out_p6);
% 
% %% Plot the pictures for check of stability
% 
% % create_pic(out_p3(1,:));  %picture number p1 as output (saved pattern)
% % create_pic(out_p3(2,:));  %picture number p2 as output (saved pattern)
% % create_pic(out_p3(3,:));  %picture number p3 as output (saved pattern)
% 
% % create_pic(out_p4(1,:));  %picture number p1 as output (saved pattern)
% % create_pic(out_p4(2,:));  %picture number p2 as output (saved pattern)
% % create_pic(out_p4(3,:));  %picture number p3 as output (saved pattern)
% % create_pic(out_p4(4,:));  %picture number p4 as output (saved pattern)
% 
% % create_pic(out_p6(1,:));  %picture number p1 as output (saved pattern)
% % create_pic(out_p6(2,:));  %picture number p2 as output (saved pattern)
% % create_pic(out_p6(3,:));  %picture number p3 as output (saved pattern)
% % create_pic(out_p6(4,:));  %picture number p5 as output (saved pattern)
% % create_pic(out_p6(5,:));  %picture number p6 as output (saved pattern)
% % create_pic(out_p6(6,:));  %picture number p7 as output (saved pattern)
% 
% %% Random patterns
% numVec = 100;
% p_rand = round(rand(140,1024))*2-1;
% 
% out_p = getPOut(p_rand,numVec);
% % p_rand4 = p_rand(1:numVec,:);
% % 
% % W4_rand = getWeightMatrix(p_rand4);
% % n_pattern_rand4 = size(p_rand4,1);                    %number of patterns
% % matrix_size_rand4 = size(p_rand);
% % %check if learning was succesfull
% % out_p_rand4 = rand_recall3_5(p_rand4,n_pattern_rand4,matrix_size_rand4,W4_rand);
% 
% %check for equality of input and output of recall
% %for learning
% fprintf('For the learning function:\n')
% equality(p_rand(1:numVec,:),out_p);
