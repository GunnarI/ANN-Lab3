function [ out_mix, error ] = p3_4_CheckNoise(output,real_p, W)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Find values for the recall function
n_pattern = size(output(1,:),1);                    %number of patterns
matrix_size = size(output(1,:));

%initialize the vector who will store how many values are wrong in the pic
error = zeros(1,length(output(:,1)));
out_mix = zeros(length(output(:,1)),length(output(1,:)));

%Let the for loop go through the number of lines of the output matrix
for i = 1:length(output(:,1))
    
    %for each noisy data we try to make it not noisy with the recall funct
    out_mix(i,:) = recall(output(i,:),n_pattern,matrix_size,W);
    
    %use the equality function to find out how many errors are made for
    %each noisy data
    error(i) = p_3_4_equality(real_p, out_mix(i,:));
end

end

