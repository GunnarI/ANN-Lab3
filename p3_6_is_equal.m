function [error] = p3_6_is_equal(pattern,W,bias)
error = 0;
for i = 1:length(pattern(:,1))
%check if learning was succesfull by having the p_learn as input
    out_spars = p3_6_recall_bias(pattern(i,:),W,bias);

%check for equality of input and output of recall
    error = p_3_4_equality(pattern(i,:),out_spars) + error;
end


end

