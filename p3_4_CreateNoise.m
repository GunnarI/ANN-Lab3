function [ output ] = p3_4_CreateNoise(p_original)
%    create randomly noisy data from 10% to 100% noisy.
%want to create 10 different noisy data for p1, from 0% to 100% jumping on
%10% = 11 different vectors.
% 

% For 10%: I first need to find how many 10% units are,

%Vector for all the percentage we want to calculate
percentage_val = [0.1, 0.2 , 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];

%Initialize the output
output = zeros(length(percentage_val),length(p_original));

for i = 1:length(percentage_val)
    
    %Find how many nr of integer we need to change for every percentage
    nr_val2change = round(percentage_val(i) * length(p_original(1,:)));
    
    %create as many random integer from 1 to 1024 as the value above tells
    random_int = randsample(1:length(p_original(1,:)),nr_val2change);
    
    %Put the output vector nr i equal to the original data
    output(i,:) = p_original(1,:);
    
    %Change the indexes of the output by multiplying by -1
    output(i,random_int) = output(i,random_int)*-1;
end


end

