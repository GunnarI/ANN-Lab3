%% Random patterns

err = 10;
i = 0;
while err > 0 && i < 50
    i=i+1;
    numVec = 90;
    p_rand = round(rand(140,1024))*2-1;

    [out_p, W] = getPOut(p_rand,numVec);

    %check for equality of input and output of recall
    %for learning
    fprintf('For the learning function:\n')
    err = equality3_5(p_rand(1:numVec,:),out_p);
end