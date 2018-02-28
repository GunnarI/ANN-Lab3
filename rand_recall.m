function output = rand_recall(input,n_patterns,matrix_size,W)
%%% update rule for recalling of the function
%with random units and the original sequential hopfield dynamics
%%%#

%output = zeros(n_patterns,matrix_size(2));

%shuffle the units
shuffle1 = randperm(matrix_size(2));
shuffle2 = randperm(matrix_size(2));

%update the function and update weights sequentially
%the output is used as the next input
output = input;
for n = 1:n_patterns
    for i = shuffle1
        weight = 0;
            for j = shuffle2
                weight = W(i,j) * output(n,j)+weight;
            end
        output(n,i) = sign(weight);
    end
end

end