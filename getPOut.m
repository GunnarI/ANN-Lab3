function [out_p, W] = getPOut(p, numVec, varargin)

p_num = p(1:numVec,:);
if ~isempty(varargin)
    p_noisy = varargin{1}(1:numVec,:);
else
    p_noisy = p_num;
end

W = getWeightMatrix(p_num);
n_pattern = size(p_num,1);                    %number of patterns
matrix_size = size(p);
%check if learning was succesfull
out_p = rand_recall3_5(p_noisy,n_pattern,matrix_size,W);

end