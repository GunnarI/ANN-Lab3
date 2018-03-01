function [W] = p3_6_weight(input, act)
%input is a n x m matrix with n patterns and m values for each pattern.


% Calculate weight matrix for learning sparse data with bias
for i = 1:size(input,2)%*size(x,1)                   %fixed for 3D data already
    for j = 1:size(input,2)
        weight = 0;
        if i ~= j                                %If this is taken away, a good solution is found
            for n = 1:size(input,1) %go through all patterns
                weight = (input(n,i) - act) .* (input(n,j) - act) + weight;
            end
        end
        W(i,j) = weight;
    end
end

end

