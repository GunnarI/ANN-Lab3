function [output,energy] = recall(input,n_patterns,matrix_size,W)
%%% update rule for recalling of the function
energy = zeros(n_patterns,matrix_size(2));
output = zeros(n_patterns,matrix_size(2));
for n = 1:n_patterns
    for i = 1:matrix_size(2)
        weight = 0;
        sum = 0;
            for j = 1:matrix_size(2)
                weight = W(i,j) * input(n,j)+weight;
                %calculating energy
                sum = W(i,j)*output(i)*output(j) + sum;
            end
        output(n,i) = sign(weight);
        energy(n,i) = -sum;
    end
    
end
end