function W = getWeightMatrix(p)

num = size(p,2);
W = zeros(num,num);
% Calculate weight matrix for learning
for i = 1:num
    for j = 1:num
        weight = 0;
        if i ~= j                                %make diagonal zero
            for n = 1:size(p,1)            %number of input patterns (mu)
                weight = p(n,i) .* p(n,j) + weight;
            end
        end
        W(i,j) = weight;
    end
end