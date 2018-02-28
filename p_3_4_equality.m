function numb_err = p_3_4_equality(input,output)
equal = output == input;                            %get matrix with right(=1) and wrong (=0)
if equal == 1
    %fprintf('Patterns are stored and right.\n\n')
    numb_err = 0;
else
    [row,col] = find(equal ~= 1);
%     for i = 1:length(row)
%         fprintf('Wrong patterns at the %d. pattern at position %d.\n',row(i),col(i))
%     end
    numb_err = length(row); %number of errors compared to learning data
end

end