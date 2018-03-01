function [ sparse_vect ] = p3_6_create_sparse_data(nr,act, len)

%creating sparse data with [act] activity
nr_val2change = round(act * len);       %number of values to change

sparse_vect = zeros(nr,len);     %initialize the vector as zeroes.

%Create the data
for i=1:nr
    random_int = randsample(1:len,nr_val2change);   %the integers we are going to change
    sparse_vect(i,random_int) = 1;    %set the values of the random integers to 1.
end

end

