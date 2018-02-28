function output = recall(input,n_patterns,matrix_size,W)
%%% update rule for recalling of the function

output = zeros(n_patterns,matrix_size(2));
for n = 1:n_patterns
    for i = 1:matrix_size(2)
        weight = 0;
            for j = 1:matrix_size(2)
                weight = W(i,j) * input(n,j)+weight;
                % look at distorted input patterns
            end
        output(n,i) = sign(weight);
    end
end

end