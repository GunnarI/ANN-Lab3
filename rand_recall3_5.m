function [output,energy] = rand_recall3_5(input,n_patterns,matrix_size,W)
%%% update rule for recalling of the function
%with random units and the original sequential hopfield dynamics
%%%#

%output = zeros(n_patterns,matrix_size(2));
energy = zeros(n_patterns,matrix_size(2));

%shuffle the units
shuffle1 = randperm(matrix_size(2));
shuffle2 = randperm(matrix_size(2));

%update the function and update weights sequentially
%the output is used as the next input
output = input;
for n = 1:n_patterns
    for i = shuffle1
        weight = 0;
        sum = 0;
            for j = shuffle2
                weight = W(i,j) * output(n,j)+weight;
                %calculating energy
                sum = W(i,j)*output(i)*output(j) + sum;
            end
        output(n,i) = sgn(weight);
        energy(n,i) = -sum;
    end
end
end