function [counter] = lyppilyppi(bias, spars_vect, act)

for i=1:length(bias)
    %Create the weight matrix with heabian learning
    j = 0;
    bool = true;
    while bool
        j = j+1;
        learn = spars_vect(1:j,:);
    
        W = p3_6_weight(learn,act);
    
        error = p3_6_is_equal(learn,W,bias(i));
    
        if error ~= 0
            counter(i) = j-1;
            bool = false;
        end
    
    end
end

end

