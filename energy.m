function E = energy(input,W)
%%%calculates the energy of a matrix using a symmetric weight function

sum = 0;
for i = 1:length(input)
    for j = 1:length(input)
        sum = W(i,j)*input(i)*input(j) + sum;
    end
end

E = -sum;