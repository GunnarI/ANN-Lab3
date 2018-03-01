function [output] = p3_6_recall_bias(input,W,bias)
%%% update rule for recalling of the function
n_patterns = length(input(:,1));
n_values = length(input(1,:));
output = zeros(n_patterns,n_values);
for n = 1:n_patterns
    for i = 1:n_values
        weight = 0;
            for j = 1:n_values
                weight = W(i,j) * input(n,j)+weight;
            end
        output(n,i) = 0.5 + 0.5*sign_0_1(weight-bias);
    end
    
end
end