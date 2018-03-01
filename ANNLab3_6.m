clear all; close all; clc;
%Ann Lab 3 Part 3.6

%Start by creating sparse data with 10% activity

nr = 200;    %number of sparse data
act1 = 0.1;  %how many are active (10%)
act2 = 0.05; % (5%)
act3 = 0.01;% (1%)
len = 100; %The length of the vectors.
bias = [-2:0.1:10];

%Create a matrix containing [nr] of sparse data vectors.
spars_vect1 = p3_6_create_sparse_data(nr, act1, len);
spars_vect2 = p3_6_create_sparse_data(nr, act2, len);
spars_vect3 = p3_6_create_sparse_data(nr, act3, len);

% for i=1:length(bias)
%     %Create the weight matrix with heabian learning
%     j = 0;
%     bool = true;
%     while bool
%         j = j+1;
%         learn = spars_vect1(1:j,:);
%     
%         W = p3_6_weight(learn,act1);
%     
%         error = p3_6_is_equal(learn,W,bias(i));
%     
%         if error ~= 0
%             counter(i) = j-1;
%             bool = false;
%         end
%     
%     end
% end

counter1 = lyppilyppi(bias,spars_vect1,act1);
counter2 = lyppilyppi(bias,spars_vect2,act2);
counter3 = lyppilyppi(bias,spars_vect3,act3);


%% 
figure
plot(bias,counter1)
xlabel('bias value')
ylabel('Nr of stored patterns')
title('10% activity')

figure
plot(bias,counter2)
xlabel('bias value')
ylabel('Nr of stored patterns')
title('5% activity')

figure
plot(bias,counter3)
xlabel('bias value')
ylabel('Nr of stored patterns')
title('1% activity')





