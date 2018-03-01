p_rand = round(rand(300,100))*2-1;
noisyPerc = 10;
p_noisy = addNoise(p_rand,noisyPerc);

err = zeros(1,300);
err_noisy = zeros(1,300);
err_perc = zeros(1,300);
corr_perc = zeros(1,300);
corr_perc_noisy = zeros(1,300);
for numVec = 1:300
    [out_p, W] = getPOut(p_rand,numVec);
    [out_p_noisy, W_noisy] = getPOut(p_rand,numVec,p_noisy);

    %check for equality of input and output of recall
    %for learning
    %fprintf('For the learning function:\n')
    err(numVec) = equality3_5(p_rand(1:numVec,:),out_p);
    err_perc(numVec) = err(numVec)/numVec;
    corr_perc(numVec) = 100*(numVec-err(numVec))/numVec;
    
    err_noisy(numVec) = equality3_5(p_rand(1:numVec,:),out_p_noisy);
    corr_perc_noisy(numVec) = 100*(numVec-err_noisy(numVec))/numVec;
end

firstError = find(err,1);
firstErrorNoisy = find(err_noisy,1);

fprintf('First error without bias and without noise: \t%d\n',firstError);
fprintf('First error without bias and with noise: \t\t%d\n',firstErrorNoisy);

plot(corr_perc)
hold on
plot(corr_perc_noisy)
title('Number of stable patterns')
xlabel('# patterns')
ylabel('Percentage stable [%]')
legend('Original', ['Noisy (' num2str(noisyPerc) '% noise)']);
