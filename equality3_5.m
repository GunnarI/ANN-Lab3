function numb_err = equality3_5(input,output)
equal = output == input;                            %get matrix with right(=1) and wrong (=0)
if equal
    fprintf('Patterns are stored and correct.\n\n')
    numb_err = 0;
else
    numb_err = size(input,1)-sum(all(equal'));%length(row); %number of errors compared to learning data
end

end
