function P_noisy = addNoise(P,numNoise)

P_noisy = P;
for i = 1:size(P,1)
    noisyInd = randperm(size(P,2),numNoise);
    P_noisy(i,noisyInd) = P_noisy(i,noisyInd)*(-1);
end

end